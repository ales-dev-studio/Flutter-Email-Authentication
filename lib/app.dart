import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../core/localization/i18n/translations.g.dart';
import '../../core/theme/theme.dart';
import '../../features/home_feature/presentation/bloc/theme_cubit.dart';

import 'core/routes/go_router_routes.dart';

/// Global key used for show snackBar without context
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(final BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return TranslationProvider(
      child: BlocBuilder<ThemeCubit, ThemeMode?>(
        builder: (final BuildContext context, final ThemeMode? themeState) {
          return KeyboardDismisser(
            child: MaterialApp.router(
              builder: (final context, final child) {
                return MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: child!,
                );
              },
              key: navigatorKey,
              routerConfig: routes,
              title: 'Flutter Authentication App',
              debugShowCheckedModeBanner: false,
              scaffoldMessengerKey: scaffoldMessengerKey,
              locale: TranslationProvider.of(context).flutterLocale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              theme: AppTheme(context).lightTheme,
              darkTheme: AppTheme(context).darkTheme,
              themeMode: themeState,
              // themeMode: ThemeMode.dark,
            ),
          );
        },
      ),
    );
  }
}
