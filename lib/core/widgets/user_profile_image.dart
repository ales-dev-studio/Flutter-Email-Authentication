import 'dart:io';
import 'package:flutter/material.dart';
import '../../core/gen/assets.gen.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/dimens.dart';
import '../../core/utils/check_theme_status.dart';
import '../../core/widgets/app_svg_viewer.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
    this.imagePath,
    this.imageFile,
    this.width,
    this.height,
    this.hasBorder = true,
    this.defaultIconPadding = Dimens.veryLargePadding,
  });

  final String? imagePath;
  final File? imageFile;
  final double? width;
  final double? height;
  final bool hasBorder;
  final double defaultIconPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 120,
      height: height ?? 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border:
            hasBorder
                ? Border.all(width: 3, color: AppColors.primaryColor)
                : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child:
            imagePath == null && imageFile == null
                ? Padding(
                  padding: EdgeInsets.all(defaultIconPadding),
                  child: AppSvgViewer(
                    Assets.icons.user,
                    setDefaultColor: false,
                    color:
                        checkDarkMode(context)
                            ? AppColors.whiteColor
                            : AppColors.primaryColor,
                  ),
                )
                : imageFile != null
                ? Image.file(imageFile!, fit: BoxFit.cover)
                : Image.asset(imagePath!, fit: BoxFit.cover),
      ),
    );
  }
}
