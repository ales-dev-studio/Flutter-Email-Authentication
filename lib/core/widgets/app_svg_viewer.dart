import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/check_theme_status.dart';

class AppSvgViewer extends StatelessWidget {
  const AppSvgViewer(
    this.path, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.setDefaultColor = true,
    this.setDefaultWidthAndHeight = true,
    this.fit,
  });

  final String path;
  final double? width;
  final double? height;
  final Color? color;
  final bool setDefaultColor;
  final bool setDefaultWidthAndHeight;
  final BoxFit? fit;

  @override
  Widget build(final BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width ?? (setDefaultWidthAndHeight ? 22 : null),
      height: height ?? (setDefaultWidthAndHeight ? 22 : null),
      colorFilter:
          setDefaultColor
              ? ColorFilter.mode(getIconColor(context), BlendMode.srcIn)
              : color == null
              ? null
              : ColorFilter.mode(color!, BlendMode.srcIn),
      fit: fit ?? BoxFit.contain,
    );
  }
}

Color getIconColor(final BuildContext context) {
  return checkDarkMode(context) ? AppColors.descriptionColor : AppColors.textColor;
}
