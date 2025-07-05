import 'package:flutter/material.dart';
import '../../app.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/check_theme_status.dart';
import '../../core/widgets/app_space.dart';

enum SnackBarType { success, error, warning, info }

Future<void> showSnackBar(
  final String? message, {
  final int? duration,
  final IconData? icon,
  final SnackBarAction? action,
  final SnackBarType? snackBarType,
}) async {
  final SnackBar snackBar = SnackBar(
    content: Builder(
      builder: (final BuildContext context) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color:
                    snackBarType == null
                        ? checkDarkMode(context)
                            ? Theme.of(context).primaryColor
                            : AppColors.whiteColor
                        : AppColors.whiteColor,
              ),
              const AppHSpace(),
            ],
            Expanded(
              child: Text(
                message.toString(),
                style: TextStyle(
                  color: snackBarType == null ? null : AppColors.whiteColor,
                ),
              ),
            ),
          ],
        );
      },
    ),
    duration: Duration(milliseconds: duration ?? 5000),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    closeIconColor: snackBarType == null ? null : AppColors.whiteColor,
    action: action,
    backgroundColor:
        snackBarType == SnackBarType.success
            ? Colors.green
            : snackBarType == SnackBarType.error
            ? Colors.red
            : snackBarType == SnackBarType.info
            ? Theme.of(scaffoldMessengerKey.currentState!.context).primaryColor
            : snackBarType == SnackBarType.warning
            ? Colors.orange
            : null,
  );
  scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}
