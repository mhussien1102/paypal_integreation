import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:paypal_integreation/core/utils/api_keys.dart';
import 'package:paypal_integreation/features/checkout/data/model/amount_model/amount_model.dart';
import 'package:paypal_integreation/features/checkout/data/model/amount_model/deatils.dart';
import 'package:paypal_integreation/features/checkout/data/model/item_list_model/item.dart';
import 'package:paypal_integreation/features/checkout/data/model/item_list_model/item_list_model.dart';
import 'package:paypal_integreation/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:paypal_integreation/features/checkout/presentation/manger/payment_cubit.dart';
import 'package:paypal_integreation/features/checkout/presentation/views/widgets/thank_you_view.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../payment_details.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.payPal});

  final bool payPal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ThankYouView()),
          );
        }

        if (state is PaymentFailure) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoading ? true : false,
          txt: "Continue",
          onPressed: () {
            if (payPal) {
              var transicationData = getTranscationData();
              excutePaypalPayment(context, transicationData);
            } else {
              excuteStripePayment(context);
            }
          },
        );
      },
    );
  }

  void excuteStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      currency: "USD",
      customerId: 'cus_TQd812GRHioqjd',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }

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
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTranscationData() {
    var amount = AmountModel(
      currency: "USD",
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: "100"),
      total: "100",
    );

    List<OrderItemModel> orders = [
      OrderItemModel(currency: "USD", name: "Apple", price: "4", quantity: 10),
      OrderItemModel(currency: "USD", name: "Banana", price: "5", quantity: 12),
    ];
    var itemList = ItemListModel(items: orders);

    return (amount: amount, itemList: itemList);
  }
}
