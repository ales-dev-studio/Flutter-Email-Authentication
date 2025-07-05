import 'dart:async';
import 'package:bloc/bloc.dart';

part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit() : super(ResendOtpState());

  void setResendCodeTime() {
    emit(state.copyWith(timeCounter: 60));

    Timer.periodic(const Duration(seconds: 1), (final timer) {
      emit(state.copyWith(timeCounter: state.timeCounter - 1));
      if (state.timeCounter <= 0) {
        timer.cancel();
      }
    });
  }
}
