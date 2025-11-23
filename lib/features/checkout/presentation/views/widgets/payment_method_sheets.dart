import 'package:flutter/material.dart';
import 'package:paypal_integreation/features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:paypal_integreation/features/checkout/presentation/views/widgets/payment_method_list_view.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../payment_details.dart';

class PaymentMethodsSheets extends StatefulWidget {
  const PaymentMethodsSheets({super.key});

  @override
  State<PaymentMethodsSheets> createState() => _PaymentMethodsSheetsState();
}

class _PaymentMethodsSheetsState extends State<PaymentMethodsSheets> {
  bool isPaypal = false;

  updatePaymentMeethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        // Removed const from here
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodListView(updatePaymentMethod: updatePaymentMeethod),
          SizedBox(height: 16),
          CustomButtonBlocConsumer(payPal: isPaypal),
        ],
      ),
    );
  }
}
