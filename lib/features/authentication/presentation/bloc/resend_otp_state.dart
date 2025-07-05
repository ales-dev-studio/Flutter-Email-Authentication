part of 'resend_otp_cubit.dart';

class ResendOtpState {
  ResendOtpState({this.timeCounter = 60});

  final int timeCounter;

  ResendOtpState copyWith({int? timeCounter}) {
    return ResendOtpState(timeCounter: timeCounter ?? this.timeCounter);
  }
}
