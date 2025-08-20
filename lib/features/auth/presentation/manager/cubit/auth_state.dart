class AuthState {}

class AuthInitial extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpLoading extends AuthState {}

class TermsAndConditionUpdateState extends AuthState {}

class SignUpError extends AuthState {
  final String errormessage;

  SignUpError(this.errormessage);
}

class SignInSuccess extends AuthState {}

class SignInLoading extends AuthState {}

class SignInError extends AuthState {
  final String errormessage;

  SignInError(this.errormessage);
}

final class ResetPasswordLoadingState extends AuthState {}

final class ResetPasswordSuccessState extends AuthState {}

final class ResetPasswordFailureState extends AuthState {
  final String errMessage;

  ResetPasswordFailureState({required this.errMessage});
}
