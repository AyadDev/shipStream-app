part of 'forgot_username_cubit.dart';

sealed class ForgotUsernameState extends Equatable {
  const ForgotUsernameState();

  @override
  List<Object> get props => [];
}

final class ForgotUsernameInitial extends ForgotUsernameState {}

class ForgotUsernameLoading extends ForgotUsernameState {}

class ForgotUsernameSuccess extends ForgotUsernameState {
  final String username;
  const ForgotUsernameSuccess({required this.username});
}

class ForgotUsernameFailure extends ForgotUsernameState {
  final String message;
  const ForgotUsernameFailure({required this.message});
}
