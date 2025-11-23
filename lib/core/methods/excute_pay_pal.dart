import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../features/checkout/data/model/amount_model/amount_model.dart';
import '../../features/checkout/data/model/item_list_model/item_list_model.dart';
import '../../features/checkout/presentation/views/my_cart_view.dart';
import '../../features/checkout/presentation/views/widgets/thank_you_view.dart';
import '../utils/api_keys.dart';

void excutePaypalPayment(
  BuildContext context,
  ({AmountModel amount, ItemListModel itemList}) transicationData,
) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.clientSecret,
        transactions: [
          {
            "amount": transicationData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transicationData.itemList..toJson(),
          },
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ThankYouView()),
            (route) {
              if (route.settings.name == '/') {
                return true;
              } else {
                return false;
              }
            },
          );
        },
        onError: (error) {
          SnackBar snackBar = SnackBar(content: Text(error.toString()));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyCartView()),
            (route) {
              if (route.settings.name == '/') {
                return true;
              } else {
                return false;
              }
            },
          );
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ),
  );
}
