import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paypal_integreation/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:paypal_integreation/features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());
  final CheckOutRepo checkOutRepo;

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());

    var data = await checkOutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    data.fold(
      (l) => emit(PaymentFailure(errMessage: l.errMessage)),
      (r) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    print(change.toString());
    super.onChange(change);
  }
}
