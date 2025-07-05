import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/dimens.dart';

class AppBorderedText extends StatelessWidget {
  const AppBorderedText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(Dimens.smallCorners),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.largePadding,
        vertical: Dimens.smallPadding,
      ),
      child: Text(text, style: TextStyle(color: AppColors.primaryColor)),
    );
  }
}
