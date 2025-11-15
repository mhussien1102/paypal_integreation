import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paypal_integreation/core/utils/api_keys.dart';
import 'package:paypal_integreation/core/utils/api_service.dart';
import 'package:paypal_integreation/features/checkout/data/model/payment_intent_input_model.dart';

import '../../features/checkout/data/model/emphemeral_key/ephemeral_key.dart';
import '../../features/checkout/data/model/payment_intent_model/payment_intent_model.dart';

class StripeServices {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
      headers: {},
      //'sk_test_51SJYJYFfRg9a1yXfMGtzQp3WfR20Y57Ooj2tyzoTNifrtINZNm12l2ze1B1ttDt13AtGA1gaJ9gok6D5Bhvnwtdk00yWLuJ6Yc',
    );

    var paymantIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymantIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "Mohammed Hussien",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKey> createEphemeralKey({required String customerId}) async {
    var response = await apiService.post(
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': "Bearer ${ApiKeys.secretKey}",
        'Stripe-Version': '2023-10-16',
      },
      //'sk_test_51SJYJYFfRg9a1yXfMGtzQp3WfR20Y57Ooj2tyzoTNifrtINZNm12l2ze1B1ttDt13AtGA1gaJ9gok6D5Bhvnwtdk00yWLuJ6Yc',
    );

    var ephemeralKey = EphemeralKey.fromJson(response.data);

    return ephemeralKey;
  }
}
