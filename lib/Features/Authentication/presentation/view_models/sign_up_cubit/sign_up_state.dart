part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {
  final bool isTermsAccepted;
  const SignUpState({required this.isTermsAccepted});
}

class SignupInitial extends SignUpState {
  const SignupInitial({required super.isTermsAccepted});
}

class SignupLoading extends SignUpState {
  const SignupLoading() : super(isTermsAccepted: false);
}

class SignupSuccess extends SignUpState {
  const SignupSuccess() : super(isTermsAccepted: false);
}

class SignupFailure extends SignUpState {
  final String message;
  const SignupFailure({required this.message}) : super(isTermsAccepted: false);
}
