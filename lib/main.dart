import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paypal_integreation/core/utils/api_keys.dart';

import 'features/checkout/presentation/views/my_cart_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishKey;

  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyCartView());
  }
}

// create Payment intent(amount, currency, customerId)

//keySecret createEphemeral Key(stripeVersion , customerId)

//init paymentSheet(merchantDisplayName, intentClientSecret, ephemeralKeySecret)

//presentPaymentSheet()
