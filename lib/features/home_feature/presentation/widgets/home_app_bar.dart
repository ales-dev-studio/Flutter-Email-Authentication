import 'package:flutter/material.dart';
import 'package:flutter_authentication_screens_ui/core/utils/sized_context.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/dimens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/utils/check_theme_status.dart';
import '../../../../core/utils/locale_handler.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.title,
    this.showBackIcon = false,
    this.textStyle,
  });

  final String title;
  final bool showBackIcon;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.0,
      width: context.widthPx,
      alignment:
          checkEnState(context) ? Alignment.centerLeft : Alignment.centerRight,
      padding:
          showBackIcon
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(horizontal: Dimens.largePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: Dimens.mediumPadding,
        children: [
          if (showBackIcon)
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
          Text(
            title,
            style:
                textStyle ??
                (checkEnState(context)
                    ? AppTypography(
                      darkStatus: checkDarkMode(context),
                    ).jaldiTextTheme.bodyLarge?.copyWith(fontSize: 22)
                    : AppTypography(
                      darkStatus: checkDarkMode(context),
                    ).vazirmatnTextTheme.bodyLarge?.copyWith(fontSize: 22)),
          ),
        ],
      ),
    );
  }
}
