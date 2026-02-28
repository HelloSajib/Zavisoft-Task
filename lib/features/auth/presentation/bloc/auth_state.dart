part of 'auth_bloc.dart';

class AuthState extends Equatable{
  final String? message;
  final Status status;
  final bool? isSignedIn;

  const AuthState({
    required this.message,
    required this.status,
    required this.isSignedIn
  });

  /// Creates the initial state for the auth screen.
  factory AuthState.initial() => const AuthState(
    message: null,
    status: Status.initial,
    isSignedIn: null
  );

  /// Creates a copy of the current state with updated values.
  AuthState copyWith({
    String? message,
    Status? status,
    bool? isSignedIn
  }) => AuthState(
    message: message ?? this.message,
    status: status ?? this.status,
    isSignedIn: isSignedIn ?? this.isSignedIn
  );

  @override
  List<Object?> get props => [];
}