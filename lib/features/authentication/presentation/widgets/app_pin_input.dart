import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_authentication_screens_ui/core/utils/check_theme_status.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimens.dart';

class AppPinInput extends StatelessWidget {
  const AppPinInput({
    super.key,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    this.length,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String>? onChanged;
  final int? length;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.0,
      height: 57.0,
      margin: const EdgeInsets.symmetric(horizontal: Dimens.smallPadding),
      textStyle: const TextStyle(fontSize: 24.0, color: AppColors.whiteColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.corners),
        color:
            checkDarkMode(context)
                ? AppColors.borderColor
                : AppColors.textFieldBorderColor,
      ),
    );
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: controller,
        focusNode: focusNode,
        length: length ?? 6,
        defaultPinTheme: defaultPinTheme,
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onChanged: onChanged,
        autofocus: true,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        cursor: Center(
          child: Container(
            width: 3.0,
            height: 22.0,
            color: AppColors.primaryColor,
          ),
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          textStyle:
              checkDarkMode(context)
                  ? TextStyle(fontSize: 24.0, color: AppColors.whiteColor)
                  : const TextStyle(
                    fontSize: 24.0,
                    color: AppColors.borderColor,
                  ),
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(Dimens.corners),
            border: Border.all(color: AppColors.primaryColor, width: 3.0),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: AppColors.primaryColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: Colors.redAccent),
        ),
      ),
    );
  }
}
