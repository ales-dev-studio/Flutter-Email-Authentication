import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_screens_ui/core/utils/sized_context.dart';
import '../../theme/colors.dart';
import '../../theme/dimens.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.title,
    this.titleWidget,
    required this.onPressed,
    this.color,
    this.spaceBetween = true,
    this.verticalMargin = Dimens.padding,
    this.borderRadius = Dimens.corners * 2,
    this.isLoading = false,
  });

  final String? title;
  final Widget? titleWidget;
  final Color? color;
  final GestureTapCallback? onPressed;
  final bool spaceBetween;
  final double verticalMargin;
  final double borderRadius;
  final bool isLoading;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: context.sizePx.width - Dimens.largePadding,
      height: 50.0,
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor:
              color == null
                  ? WidgetStateProperty.all<Color>(AppColors.primaryColor)
                  : WidgetStateProperty.all<Color>(color!),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child:
            isLoading
                ? Center(
                  child: CupertinoActivityIndicator(
                    color: AppColors.whiteColor,
                  ),
                )
                : titleWidget ??
                    Text(
                      title ?? '',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
      ),
    );
  }
}
