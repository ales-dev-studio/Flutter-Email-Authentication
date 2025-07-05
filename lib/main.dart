import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/localization/i18n/translations.g.dart';
import '../../core/locators/authentication_locators.dart';
import '../../core/locators/profile_locators.dart';
import '../../core/utils/app_http_overrides.dart';
import '../../core/utils/locale_handler.dart';
import '../../global_bloc_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupAuthenticationLocators();
  setupProfileLocators();

  /// Get locale from device storage and set it
  LocaleSettings.setLocale(await LocaleHandler().getLocale());

  /// Affect the browser's URL bar in flutter web app
  GoRouter.optionURLReflectsImperativeAPIs = true;

  /// By default, the flutter's http client rejects calls that trying to
  /// communicate with an service having unverified security certificate
  /// we overwrite default http client to fix related errors
  HttpOverrides.global = AppHttpOverrides();

  runApp(GlobalBlocProviders.blocProviders);
}
