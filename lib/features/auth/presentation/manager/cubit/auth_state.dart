class AuthState {}

class AuthInitial extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpLoading extends AuthState {}

class SignUpError extends AuthState {
  final String message;

  SignUpError(this.message);
}
