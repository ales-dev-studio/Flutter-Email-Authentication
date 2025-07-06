class Routes {
  static const String baseUrl = 'https://your-api-address.com/';
  static const String register = 'auth/register';
  static const String login = 'auth/login';
  static const String logout = 'auth/logout';
  static const String authWithGoogle = 'auth/google';
  static const String authWithGoogleCallback = 'auth/google/callback';
  static const String forgotPassword = 'password-reset/forgot';
  static const String verifyResetPasswordOTP = 'password-reset/verify';
  static const String resetPassword = 'password-reset/reset';
  static const String resendPasswordResetOTP = 'password-reset/resend';
  static const String verifyRegisterOTP = 'verification/verify-email';
  static const String resendEmailVerificationOTP = 'verification/resend';
  static const String userProfile = 'users/profile';
}
