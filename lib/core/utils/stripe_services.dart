import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:paypal_integreation/core/utils/api_keys.dart';
import 'package:paypal_integreation/core/utils/api_service.dart';

import 'package:paypal_integreation/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:paypal_integreation/features/checkout/data/model/payment_intent_model/payment_intent_model.dart';
import 'package:paypal_integreation/features/checkout/data/model/initi_payment_sheet_input_model.dart';
// تأكد إن الباث ده صح عندك
import 'package:paypal_integreation/features/checkout/data/model/emphemeral_key/ephemeral_key.dart';

class StripeServices {
  final ApiService apiService = ApiService();

  /// 1) Create PaymentIntent on Stripe
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
      // ما نعتمدش على token هنا، نبعـت Authorization صريح
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}', // sk_test_...
      },
      token: ApiKeys.secretKey,
    );

    final paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  /// 2) Create Ephemeral Key for a specific customer
  Future<EphemeralKey> createEphemeralKey({required String customerId}) async {
    final response = await apiService.post(
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      contentType: Headers.formUrlEncodedContentType,
      // برضه هنا نبعت الهيدر كامل
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}', // sk_test_...
        'Stripe-Version': '2023-10-16', // نفس الـ API version اللي في Dashboard
      },
      token: ApiKeys.secretKey,
    );

    final ephemeralKey = EphemeralKey.fromJson(response.data);
    return ephemeralKey;
  }

  /// 3) Init Stripe Payment Sheet
  Future<void> initPaymentSheet({
    required InitiPaymentSheetModel init_payment_sheet_model,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: init_payment_sheet_model.clientSecret,
        merchantDisplayName: 'Mohammed Hussien',
        customerEphemeralKeySecret: init_payment_sheet_model.ephemeralKeySecret,
        customerId: init_payment_sheet_model.customerId,
      ),
    );
  }

  /// 4) Present Payment Sheet
  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  /// 5) Full flow: PI + ephemeral key + init + show
  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    // Create PaymentIntent
    final paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel,
    );

    // Create Ephemeral Key for this customer
    final ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );

    // Build model for initPaymentSheet
    final initPaymentSheetModel = InitiPaymentSheetModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );

    // Init + present payment sheet
    await initPaymentSheet(init_payment_sheet_model: initPaymentSheetModel);

    await displayPaymentSheet();
  }
}
