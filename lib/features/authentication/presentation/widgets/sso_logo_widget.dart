import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/utils/check_theme_status.dart';
import '../../../../core/widgets/app_svg_viewer.dart';

class SsoLogoWidget extends StatelessWidget {
  const SsoLogoWidget({
    super.key,
    required this.logoPath,
    required this.color,
    this.title,
  });

  final String logoPath;
  final Color color;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: title == null ? 70 : 120,
      height: 45,
      child: Container(
        decoration: BoxDecoration(
          color:
              checkDarkMode(context)
                  ? AppColors.textFieldBackgroundColorDark
                  : null,
          border: Border.all(
            color: AppColors.textFieldBorderColor.withValues(alpha: 0.6),
          ),
          borderRadius: BorderRadius.circular(Dimens.corners),
        ),
        padding: EdgeInsets.all(Dimens.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSvgViewer(logoPath, color: color, setDefaultColor: false),
            if (title != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.largePadding,
                ),
                child: Text(title ?? ''),
              ),
          ],
        ),
      ),
    );
  }
}
