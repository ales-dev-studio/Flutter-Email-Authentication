import 'package:flutter/material.dart';

class AppTitleText extends StatelessWidget {

  const AppTitleText(this.text, {super.key});
  final String? text;

  @override
  Widget build(final BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      text ?? '',
      style: textTheme.titleMedium,
    );
  }
}
