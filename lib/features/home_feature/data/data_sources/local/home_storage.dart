import 'package:shared_preferences/shared_preferences.dart';

class HomeStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// Store app dark/light theme status
  Future<void> setTheme(final String theme) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('theme', theme);
  }

  /// Get app theme status
  Future<String?> getTheme() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('theme');
  }

  /// Store app supported language locale
  Future<void> setLanguageLocale(final String lan) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('language', lan);
  }

  /// Get app language locale
  Future<String?> getLanguageLocale() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('language');
  }

  /// save false to not show the introduction page
  Future<void> setOnboardingDisplayState(final bool state) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool("introductionDisplayState", state);
  }

  Future<bool> getOnboardingDisplayState() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool("introductionDisplayState") ?? true;
  }

  Future<void> setRequestOTPTime() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('OTPTime', DateTime.now().toString());
  }

  Future<String> getRequestOTPTime() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('OTPTime') ?? DateTime.now().toString();
  }
}
