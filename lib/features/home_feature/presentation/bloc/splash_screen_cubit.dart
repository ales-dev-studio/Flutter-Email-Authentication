import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/go_routes_path.dart';
import '../../../../core/utils/check_network_connection_status.dart';
import '../../../authentication/data/data_source/local/auth_storage.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit(this.context) : super(SplashScreenState());

  void checkStatus() {
    emit(state.copyWith(noConnectivity: false, serverDown: false));

    checkNetworkConnectionStatus()
        .then((final value) async {
          if (value) {
            emit(state.copyWith(noConnectivity: false));
            _getNavigationRoute();
          } else {
            emit(state.copyWith(noConnectivity: true));
          }
        })
        .catchError((final onError) {
          emit(state.copyWith(noConnectivity: true));
        });
  }

  final BuildContext context;

  Future<void> _getNavigationRoute() async {
    String? token = await AuthStorage().getToken();

    bool isEmailVerified = await AuthStorage().getEmailVerificationStatus();

    if (token == null) {
      _navigateTo(GoRoutesPath.authentication);
      return;
    } else {
      if (isEmailVerified) {
        _navigateTo(GoRoutesPath.home);
      } else {
        _navigateTo(GoRoutesPath.signIn);
      }
    }
  }

  Future<void> _navigateTo(String navigationRoute) async {
    if (!state.serverDown || !state.noConnectivity) {
      if (context.mounted) {
        context.goNamed(navigationRoute);
      }
    }
  }
}
