import 'package:flutter/material.dart';

dynamic appFullscreenDialog(
  final BuildContext context,
  final Widget page, {
  final bool fullscreenDialog = true,
}) async {
  return await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (final context) => page,
      fullscreenDialog: fullscreenDialog,
    ),
  );
}
