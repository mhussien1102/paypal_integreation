import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paypal_integreation/core/errors/failure.dart';
import 'package:paypal_integreation/core/utils/stripe_services.dart';
import 'package:paypal_integreation/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:paypal_integreation/features/checkout/data/repos/checkout_repo.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  final StripeServices stripeService = StripeServices();
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );

      return right(null);
    } on StripeException catch (e) {
      return left(
        ServerFailure(errMessage: e.error.message ?? "OOps there was error"),
      );
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
