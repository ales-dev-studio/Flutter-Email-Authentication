import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';

class AuthIllustration extends StatelessWidget {
  const AuthIllustration({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 250.0,
      child: Image.asset(Assets.images.enterOTP.path, fit: BoxFit.fitWidth),
    );
  }
}
