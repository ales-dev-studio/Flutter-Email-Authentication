import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../../../core/widgets/app_text_form_field.dart';


class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.controller,
    this.textInputAction,
  });

  final TextEditingController controller;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      hinText: t.email,
      labelText: t.email,
      textInputType: TextInputType.emailAddress,
      hasValidation: true,
      prefixIcon: TextFieldIconWidget(Assets.icons.mail),
      textInputAction: textInputAction ?? TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return t.enterAValidEmail;
        }
        if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return t.enterAValidEmail;
        }
        return null;
      },
    );
  }
}
