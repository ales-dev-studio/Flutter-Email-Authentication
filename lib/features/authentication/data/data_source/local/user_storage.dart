import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// store user last location with this format => lat/long
  Future<void> setLastLocation(final String location) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('location', location);
  }

  Future<String?> getLastLocation() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('location');
  }
}
