import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(
  final String? url, {
  final bool openInSelfTab = false,
}) async {
  try {
    if (url == null) {
      return;
    }
    final Uri uri = Uri.parse(url);
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: openInSelfTab ? '_self' : null,
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}
