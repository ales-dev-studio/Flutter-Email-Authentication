import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/locators/locator.dart';
import '../../features/authentication/presentation/bloc/authentication_cubit.dart';
import '../../features/authentication/presentation/bloc/profile_cubit.dart';
import '../../features/home_feature/presentation/bloc/bottom_navigation_cubit.dart';
import '../../features/home_feature/presentation/bloc/theme_cubit.dart';

import 'app.dart';

class GlobalBlocProviders {
  static MultiBlocProvider get blocProviders => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (final BuildContext context) => BottomNavigationCubit(),
      ),
      BlocProvider(create: (final BuildContext context) => ThemeCubit()),
      BlocProvider(
        create: (final BuildContext context) => locator<AuthenticationCubit>(),
      ),
      BlocProvider(
        create: (final BuildContext context) => locator<ProfileCubit>(),
      ),
    ],
    child: const App(),
  );

  static Future<void> initGlobalData(final BuildContext context) async {
    /// Global blocs initialization goes here.
  }
}
