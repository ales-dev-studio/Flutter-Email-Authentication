import 'package:flutter_authentication_screens_ui/features/authentication/data/models/verify_otp_params.dart';

class ResendOTPParams {
  OTPVerificationType otpVerificationType;
  String email;

  ResendOTPParams({required this.otpVerificationType, required this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}
