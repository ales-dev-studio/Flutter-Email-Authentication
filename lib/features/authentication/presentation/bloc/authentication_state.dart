part of 'authentication_cubit.dart';

class AuthenticationState {
  AuthenticationState({
    required this.registerStatus,
    required this.loginStatus,
    required this.logoutStatus,
    required this.forgotPasswordStatus,
    required this.verifyOTPStatus,
    required this.resetPasswordStatus,
    required this.resendPasswordStatus,
  });

  final Status registerStatus;
  final Status loginStatus;
  final Status logoutStatus;
  final Status forgotPasswordStatus;
  final Status verifyOTPStatus;
  final Status resetPasswordStatus;
  final Status resendPasswordStatus;

  AuthenticationState copyWith({
    Status? registerStatus,
    Status? loginStatus,
    Status? logoutStatus,
    Status? forgotPasswordStatus,
    Status? verifyOTPStatus,
    Status? resetPasswordStatus,
    Status? resendPasswordStatus,
  }) {
    return AuthenticationState(
      registerStatus: registerStatus ?? this.registerStatus,
      loginStatus: loginStatus ?? this.loginStatus,
      logoutStatus: logoutStatus ?? this.logoutStatus,
      forgotPasswordStatus: forgotPasswordStatus ?? this.forgotPasswordStatus,
      verifyOTPStatus: verifyOTPStatus ?? this.verifyOTPStatus,
      resetPasswordStatus: resetPasswordStatus ?? this.resetPasswordStatus,
      resendPasswordStatus: resendPasswordStatus ?? this.resendPasswordStatus,
    );
  }
}
