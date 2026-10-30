part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;

  AuthSignUpRequested({
    required this.email,
    required this.password,
  });
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({
    required this.email,
    required this.password,
  });
}
