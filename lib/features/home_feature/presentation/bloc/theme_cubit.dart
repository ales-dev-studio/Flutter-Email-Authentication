import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../data/data_sources/local/home_storage.dart';

class ThemeCubit extends Cubit<ThemeMode?> {
  ThemeCubit() : super(null) {
    initTheme();
  }

  Future<void> setLightMode() async {
    HomeStorage().setTheme('light');
    emit(ThemeMode.light);
  }

  Future<void> setDarkMode() async {
    HomeStorage().setTheme('dark');
    emit(ThemeMode.dark);
  }

  Future<void> setSystemDefault() async {
    HomeStorage().setTheme('system');
    emit(ThemeMode.system);
  }

  String getThemeStatusTitle() {
    switch (state) {
      case ThemeMode.system:
        return t.systemDefault;
      case ThemeMode.light:
        return t.dayMode;
      case ThemeMode.dark:
        return t.nightMode;
      case null:
        return t.nightMode;
    }
  }

  Future<void> initTheme() async {
    final String? storedTheme = await HomeStorage().getTheme();
    if (storedTheme == null) {
      emit(ThemeMode.light);
    }
    if (storedTheme == 'light') {
      emit(ThemeMode.light);
    }
    if (storedTheme == 'dark') {
      emit(ThemeMode.dark);
    }
    if (storedTheme == 'system') {
      emit(ThemeMode.system);
    }
  }
}
