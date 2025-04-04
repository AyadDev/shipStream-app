import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../auth_repository.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository authRepository;

  ForgotPasswordCubit({required this.authRepository})
      : super(ForgotPasswordInitial());

  Future<void> forgotPassword(
      {required String email, required String phone}) async {
    emit(ForgotPasswordLoading());
    try {
      final result =
          await authRepository.forgotPassword(email: email, phone: phone);
      if (result != null) {
        emit(const ForgotPasswordSuccess(
            message: "Check your email for instructions"));
      } else {
        emit(const ForgotPasswordFailure(message: "Username not found"));
      }
    } catch (e) {
      emit(ForgotPasswordFailure(message: e.toString()));
    }
  }
}
