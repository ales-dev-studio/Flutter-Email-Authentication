import 'package:flutter/material.dart';

class AppTitleLargeText extends StatelessWidget {

  const AppTitleLargeText(this.text, {super.key});
  final String? text;

  @override
  Widget build(final BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      text ?? '',
      style: textTheme.titleLarge,
    );
  }
}
