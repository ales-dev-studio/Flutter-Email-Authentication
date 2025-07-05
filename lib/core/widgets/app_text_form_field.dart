import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/localization/i18n/translations.g.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/dimens.dart';
import '../../core/utils/check_theme_status.dart';
import '../../core/utils/locale_handler.dart';
import '../../core/widgets/app_svg_viewer.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.validator,
    this.controller,
    this.initialValue,
    this.labelText,
    this.errorText,
    this.focusNode,
    this.nextFocusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputType,
    this.maxLine,
    this.isMaxLineNull = false,
    this.obSecure,
    this.maxLength,
    this.hinText,
    this.textInputAction,
    this.textStyle,
    this.suffixTextStyle,
    this.textDirection,
    this.inputFormatters,
    this.autoValidate = false,
    this.displayErrorState = true,
    this.onTap,
    this.suffixTextBackgroundColor,
    this.suffixText,
    this.prefixText,
    this.centerText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.autoFocus = false,
    this.isDark,
    this.hintStyle,
    this.displayCounterText = false,
    this.showBorder = true,
    this.enabled,
    this.borderRadius,
    this.contentPadding,
    this.fillColor,
    this.hasValidation = false,
    this.required = false,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? initialValue;
  final String? labelText;
  final String? errorText;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final int? maxLine;
  final bool isMaxLineNull;
  final bool? obSecure;
  final int? maxLength;
  final String? hinText;
  final TextStyle? textStyle;
  final TextStyle? suffixTextStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool displayErrorState;
  final bool autoValidate;
  final Color? suffixTextBackgroundColor;
  final String? suffixText;
  final String? prefixText;
  final TextDirection? textDirection;
  final bool centerText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool autoFocus;
  final bool? isDark;
  final bool displayCounterText;
  final bool showBorder;
  final bool? enabled;
  final bool hasValidation;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool required;

  @override
  Widget build(final BuildContext context) {
    final Color color = AppColors.primaryColor;
    return TextFormField(
      initialValue: initialValue,
      enabled: enabled ?? true,
      textAlign: centerText ? TextAlign.center : TextAlign.start,
      textDirection: textDirection,
      validator:
          hasValidation
              ? validator ??
                  (final value) {
                    return selfValidator(value, context);
                  }
              : null,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onFieldSubmitted ?? selfSubmit,
      onTap: onTap,
      keyboardType: textInputType,
      inputFormatters:
          (textInputType == TextInputType.number ||
                  textInputType == TextInputType.phone
              ? <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                if (inputFormatters != null) ...inputFormatters!,
              ]
              : null),
      autocorrect: false,
      autofocus: autoFocus,
      maxLength: maxLength,
      obscureText: obSecure ?? false,
      obscuringCharacter: '*',
      maxLines: isMaxLineNull ? null : (maxLine ?? 1),
      textInputAction:
          textInputAction ??
          (nextFocusNode != null ? TextInputAction.next : TextInputAction.done),
      style: textStyle,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        counterText: displayCounterText ? null : '',
        hintText: hinText,
        hintStyle: hintStyle,
        hintTextDirection: textDirection,
        fillColor:
            fillColor ??
            (checkDarkMode(context)
                ? AppColors.textFieldBackgroundColorDark
                : AppColors.whiteColor),
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon:
            suffixText != null
                ? Container(
                  width: 32.0,
                  decoration: BoxDecoration(color: suffixTextBackgroundColor),
                  margin: const EdgeInsets.only(
                    left: Dimens.smallPadding,
                    right: Dimens.smallPadding,
                  ),
                  child: Center(
                    child: Text(
                      suffixText!,
                      style:
                          suffixTextStyle ??
                          TextStyle(
                            color: showBorder ? color : Colors.transparent,
                          ),
                    ),
                  ),
                )
                : suffixIcon,
        suffixIconConstraints: const BoxConstraints(maxWidth: 200),
        labelText:
            labelText == null ? null : labelText! + (required ? ' * ' : ''),
        labelStyle:
            enabled == null
                ? null
                : enabled!
                ? null
                : TextStyle(
                  color:
                      checkDarkMode(context)
                          ? AppColors.whiteColor.withValues(alpha: 0.7)
                          : AppColors.blackColor.withValues(alpha: 0.5),
                ),
        errorText: errorText,
        errorStyle: TextStyle(fontSize: displayErrorState ? 13 : 0.0),
        prefix: prefixText != null ? Text(prefixText!) : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: showBorder ? color : Colors.transparent,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(Dimens.corners),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                checkDarkMode(context)
                    ? Colors.transparent
                    : AppColors.textFieldBorderColor,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(Dimens.corners),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: borderRadius ?? BorderRadius.circular(Dimens.corners),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: showBorder ? Colors.red : Colors.transparent,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(Dimens.corners),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: showBorder ? Colors.red : Colors.transparent,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(Dimens.corners),
        ),
      ),
    );
  }

  String? selfValidator(final String? value, final BuildContext context) {
    final String temp =
        checkEnState(context)
            ? '${t.enterSelf} ${labelText ?? ''}'
            : '${labelText ?? ''} ${t.enterSelf}';
    if (value!.isEmpty) {
      return '${t.please} $temp';
    } else if (maxLength != null && value.length < maxLength!) {
      return '$maxLength ${t.number}';
    } else {
      return null;
    }
  }

  void selfSubmit(final String value) {
    if (focusNode != null) {
      focusNode?.unfocus();
    }
    if (nextFocusNode != null) {
      nextFocusNode!.requestFocus();
    }
  }
}

class TextFieldIconWidget extends StatelessWidget {
  const TextFieldIconWidget(this.iconPath, {super.key});

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.mediumPadding),
      child: SizedBox(
        width: 16.0,
        child: AppSvgViewer(
          iconPath,
          setDefaultColor: checkDarkMode(context),
          color: AppColors.blackColor.withValues(alpha: 0.65),
        ),
      ),
    );
  }
}
