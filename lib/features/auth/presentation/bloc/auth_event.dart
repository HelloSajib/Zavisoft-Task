import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable{}

class SignIn extends AuthEvent{
  final String username;
  final String password;

  SignIn({
    required this.username,
    required this.password
  });

  @override
  List<Object?> get props => [
    username,
    password
  ];

}