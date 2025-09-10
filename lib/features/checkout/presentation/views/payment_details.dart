import 'package:flutter/material.dart';
import 'package:paypal_integreation/features/checkout/presentation/views/widgets/payment_datails_body.dart';

import '../../../../core/methods/build_appbar.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: "Payment Details"),
      body: PaymentDetailsBody(),
    );
  }
}
