import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.verticalDivider = false,
    this.width,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
  });

  final bool verticalDivider;
  final double? width;
  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(final BuildContext context) {
    return verticalDivider
        ? VerticalDivider(
          width: width,
          thickness: thickness,
          indent: indent,
          endIndent: endIndent,
          color: color,
        )
        : Divider(
          height: height,
          thickness: thickness,
          indent: indent,
          endIndent: endIndent,
          color: color,
        );
  }
}
