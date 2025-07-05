import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// Store server authentication token
  Future<void> saveToken(final String token) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('token', token);
  }

  /// Get server authentication token from local storage
  Future<String?> getToken() async {
    final SharedPreferences prefs = await _prefs;
    String? token = prefs.getString('token');
    if (token == null) {
      return null;
    }
    return 'Bearer ${prefs.getString('token')}';
  }

  Future<void> saveEmailVerificationStatus(final bool status) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('emailVerificationStatus', status);
  }

  Future<bool> getEmailVerificationStatus() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('emailVerificationStatus') ?? false;
  }

  /// Clear token when logout
  Future<bool> clearToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove('token');
  }
}
