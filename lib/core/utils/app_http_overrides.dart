import 'dart:io';

class AppHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(final SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (
          final X509Certificate cert,
          final String host,
          final int port,
          ) =>
      true;
  }
}