import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/utils/locale_handler.dart';
import '../../../../core/widgets/app_error_again.dart';
import '../../../../core/widgets/app_loading.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_space.dart';
import '../bloc/splash_screen_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<SplashScreenCubit>(
      create: (final context) => SplashScreenCubit(context),
      child: const _SplashScreen(),
    );
  }
}

class _SplashScreen extends StatefulWidget {
  const _SplashScreen();

  @override
  State<_SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<_SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      context.read<SplashScreenCubit>().checkStatus();
    });
  }

  @override
  Widget build(final BuildContext context) {
    final watch = context.watch<SplashScreenCubit>();
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Authentication', style: TextStyle(fontSize: 25)),
          const AppVSpace(space: Dimens.extraLargePadding),
          if (watch.state.noConnectivity || watch.state.serverDown)
            AppErrorAgain(
              errorMessage: t.noInternet,
              onReloadButtonTap: () {
                context.read<SplashScreenCubit>().checkStatus();
              },
            )
          else
            const SizedBox(height: 130, child: AppLoading()),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.extraLargePadding),
        child: Row(
          spacing: Dimens.smallPadding,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (checkEnState(context)) ...[
              Text('Powered by'),
              Text('Ales Dev', style: TextStyle(color: AppColors.orangeColor)),
            ] else ...[
              Text('پشتیبانی شده توسط'),
              Text('Ales Dev', style: TextStyle(color: AppColors.orangeColor)),
            ],
          ],
        ),
      ),
    );
  }
}
