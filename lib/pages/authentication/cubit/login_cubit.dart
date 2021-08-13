import 'package:admin_panel_jjt/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authenticationRepository})
      : super(const LoginState());

  final AuthenticationRepository authenticationRepository;

  Future<void> login(String username, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await authenticationRepository.signIn(
          username: username, password: password);
      emit(state.copyWith(status: LoginStatus.done));
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
