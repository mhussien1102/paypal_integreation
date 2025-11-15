import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:paypal_integreation/core/utils/api_keys.dart';
import 'package:paypal_integreation/core/utils/api_service.dart';

import 'package:paypal_integreation/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:paypal_integreation/features/checkout/data/model/payment_intent_model/payment_intent_model.dart';
import 'package:paypal_integreation/features/checkout/data/model/initi_payment_sheet_input_model.dart';
// عدّل اسم الملف هنا حسب ما انت مسميه (ephemeral_key_model.dart مثلاً)
import 'package:paypal_integreation/features/checkout/data/model/emphemeral_key/ephemeral_key.dart';

class StripeServices {
  final ApiService apiService = ApiService();

  /// Create PaymentIntent on Stripe
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
      headers: const {},
    );

    final paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  /// Create Ephemeral Key for a specific customer
  Future<EphemeralKey> createEphemeralKey({required String customerId}) async {
    final response = await apiService.post(
      body: {'customer': customerId},
      // ✅ ده end-point الصحيح ل Ephemeral Keys
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
      headers: const {
        // ✅ لازم تبعت Stripe-Version
        'Stripe-Version': '2023-10-16',
      },
    );

    final ephemeralKey = EphemeralKey.fromJson(response.data);
    return ephemeralKey;
  }

  /// Init Stripe Payment Sheet
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

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    final paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel,
    );

    final ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );

    // 3) Build model for initPaymentSheet
    final initPaymentSheetModel = InitiPaymentSheetModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );

    // 4) Init + present Payment Sheet
    await initPaymentSheet(init_payment_sheet_model: initPaymentSheetModel);

    await displayPaymentSheet();
  }
}
