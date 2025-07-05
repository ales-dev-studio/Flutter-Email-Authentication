import 'package:flutter/material.dart';
import '../../core/localization/i18n/translations.g.dart';
import '../../core/widgets/app_space.dart';
import '../../core/widgets/buttons/app_outlined_button.dart';

class AppErrorAgain extends StatelessWidget {
  const AppErrorAgain({
    super.key,
    required this.onReloadButtonTap,
    this.errorMessage,
    this.textStyle,
  });

  final String? errorMessage;
  final GestureTapCallback onReloadButtonTap;
  final TextStyle? textStyle;

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage ?? t.throwException,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
          const AppVSpace(),
          AppOutlinedButton(
            onPressed: onReloadButtonTap,
            title: t.tryAgain,
            icon: Icons.refresh,
            textStyle: textStyle,
          ),
        ],
      ),
    );
  }
}
