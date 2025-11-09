import 'package:dartz/dartz.dart';
import 'package:paypal_integreation/features/checkout/data/model/payment_intent_input_model.dart';

import '../../../../core/errors/failure.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
