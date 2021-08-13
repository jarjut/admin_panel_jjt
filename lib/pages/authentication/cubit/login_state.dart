part of 'login_cubit.dart';

enum LoginStatus {
  start,
  loading,
  error,
  done,
}

class LoginState extends Equatable {
  const LoginState({this.status = LoginStatus.start, this.errorMessage});

  final LoginStatus status;
  final String? errorMessage;

  LoginState copyWith({LoginStatus? status, String? errorMessage}) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
