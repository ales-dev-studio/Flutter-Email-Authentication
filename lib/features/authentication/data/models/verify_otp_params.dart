enum OTPVerificationType { register, login, forgotPassword }

class VerifyOTPParams {
  OTPVerificationType otpVerificationType;
  String? email;
  String? code;

  VerifyOTPParams({required this.otpVerificationType, this.email, this.code});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['code'] = code;
    return data;
  }
}
