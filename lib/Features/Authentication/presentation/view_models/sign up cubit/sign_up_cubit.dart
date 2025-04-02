import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../auth_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;

  SignUpCubit({required this.authRepository})
      : super(const SignupInitial(isTermsAccepted: false));

  void toggleTermsAgreement() {
    emit(SignupInitial(isTermsAccepted: !state.isTermsAccepted));
  }

  Future<void> signUp({
    required String username,
    required String email,
    required String phoneCode,
    required String phoneNumber,
    required String password,
  }) async {
    if (!state.isTermsAccepted) {
      emit(const SignupFailure(message: "الرجاء الموافقة على الشروط والأحكام"));
      return;
    }

    emit(const SignupLoading());
    try {
      final result = await authRepository.signUp(
        username: username,
        email: email,
        phoneCode: phoneCode,
        phoneNumber: phoneNumber,
        password: password,
      );
      if (result) {
        emit(const SignupSuccess());
      } else {
        emit(const SignupFailure(message: "فشل التسجيل"));
      }
    } catch (e) {
      emit(SignupFailure(message: e.toString()));
    }
  }
}
