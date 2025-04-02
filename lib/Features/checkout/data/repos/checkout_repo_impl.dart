
// import '../../../../core/errors/failures.dart';
// import '../../../../core/utils/stripe_service.dart';
// import '../models/payment_intent_input_model.dart';

// class CheckoutRepoImpl extends CheckoutRepo {
//   final StripeService stripeService = StripeService();
//   @override
//   Future<Either<Failure, void>> makePayment(
//       {required PaymentIntentInputModel paymentIntentInputModel}) async {
//     try {
//       await stripeService.makePayment(
//           paymentIntentInputModel: paymentIntentInputModel);

//       return right(null);
//     } on StripeException catch (e) {
//       return left(ServerFailure(
//           errMessage: e.error.message ?? 'Oops there was an error'));
//     } catch (e) {
//       return left(ServerFailure(errMessage: e.toString()));
//     }
//   }
// }
