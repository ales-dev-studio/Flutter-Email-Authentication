import 'package:connectivity_plus/connectivity_plus.dart';
import '../../core/utils/check_platforms.dart';

Future<bool> checkNetworkConnectionStatus() async {
  try {
    if (PlatformChecker.isDesktop()) {
      return true;
    }
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.vpn)) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

Future<bool> checkNetworkConnectionIsVpn() async {
  try {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.vpn)) {
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}
