import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/dimens.dart';
import '../app_space.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    this.title,
    this.color,
    this.icon,
    this.verticalMargin = Dimens.padding,
    this.child,
    this.textStyle,
  });

  final String? title;
  final Color? color;
  final GestureTapCallback? onPressed;
  final IconData? icon;
  final double verticalMargin;
  final Widget? child;
  final TextStyle? textStyle;

  @override
  Widget build(final BuildContext context) {
    return Container(
      height: 45.0,
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: color ?? AppColors.primaryColor),
        ),
        child:
            child ??
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon == null)
                  const SizedBox.shrink()
                else
                  Icon(icon, size: 20, color: AppColors.primaryColor,),
                if (icon == null)
                  const SizedBox.shrink()
                else
                  const AppHSpace(),
                Text(
                  title ?? '',
                  style: textStyle ?? TextStyle(color: AppColors.primaryColor),
                ),
                if (icon == null)
                  const SizedBox.shrink()
                else
                  const SizedBox(width: Dimens.padding),
              ],
            ),
      ),
    );
  }
}
