import 'package:flutter/material.dart';

class TransparentAppBar extends StatelessWidget {
  const TransparentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: AppBar(backgroundColor: Colors.transparent),
    );
  }
}
