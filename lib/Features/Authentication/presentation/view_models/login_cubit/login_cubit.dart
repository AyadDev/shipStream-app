import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit({required this.authRepository}) : super(LoginInitial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final result =
          await authRepository.login(username: username, password: password);
      if (result) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(
            message: 'Invalid username and / or password\nPlease try again'));
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
