part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final LoginInputs inputs;
  const LoginEvent(
    this.inputs,
  );

  @override
  List<Object> get props => [inputs];
}
