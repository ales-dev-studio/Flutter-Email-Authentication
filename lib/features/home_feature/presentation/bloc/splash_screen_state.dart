part of 'splash_screen_cubit.dart';

class SplashScreenState {
  SplashScreenState({
    this.noConnectivity = false,
    this.serverDown = false,
  });

  final bool noConnectivity;
  final bool serverDown;

  SplashScreenState copyWith({
    final bool? noConnectivity,
    final bool? serverDown,
  }) {
    return SplashScreenState(
      noConnectivity: noConnectivity ?? this.noConnectivity,
      serverDown: serverDown ?? this.serverDown,
    );
  }
}
