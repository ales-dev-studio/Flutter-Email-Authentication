import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';

class SelectedCheckWidget extends StatelessWidget {
  const SelectedCheckWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Icon(Icons.check, color: AppColors.whiteColor, size: 14),
      ),
    );
  }
}
