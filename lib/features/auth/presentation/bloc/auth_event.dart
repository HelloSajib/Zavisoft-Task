import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable{}

class SignIn extends AuthEvent{
  final String userName;
  final String password;

  SignIn({
    required this.userName,
    required this.password
  });

  @override
  List<Object?> get props => [
    userName,
    password
  ];

}