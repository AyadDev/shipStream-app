import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../auth_repository.dart';
part 'forgot_username_state.dart';

class ForgotUsernameCubit extends Cubit<ForgotUsernameState> {
  final AuthRepository authRepository;

  ForgotUsernameCubit({required this.authRepository})
      : super(ForgotUsernameInitial());

  Future<void> forgotUsername(
      {required String email, required String phone}) async {
    emit(ForgotUsernameLoading());
    try {
      final result =
          await authRepository.forgotUsername(email: email, phone: phone);
      if (result != null) {
        emit(ForgotUsernameSuccess(username: result));
      } else {
        emit(const ForgotUsernameFailure(message: 'Email not registered'));
      }
    } catch (e) {
      emit(ForgotUsernameFailure(message: e.toString()));
    }
  }
}
