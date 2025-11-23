import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/checkout/data/model/payment_intent_input_model.dart';
import '../../features/checkout/presentation/manger/payment_cubit.dart';

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
