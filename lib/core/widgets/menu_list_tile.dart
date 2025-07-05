import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/dimens.dart';
import '../../core/utils/check_theme_status.dart';
import '../../core/widgets/app_space.dart';
import '../../core/widgets/app_svg_viewer.dart';

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    super.key,
    this.iconPath,
    this.trailingIconPath,
    required this.title,
    this.subtitle,
    this.titleTextStyle,
    this.onTab,
    this.setDefaultIconColor,
    this.iconColor,
    this.setDefaultTrailingIconColor,
    this.hasTileColor = false,
    this.hasBorder = false,
    this.borderRadius,
    this.widgetInFrontOfTheTitle,
    this.trailingWidget,
    this.contentPadding,
    this.iconSize,
    this.leading,
    this.subtitleTextStyle,
  });

  final String? iconPath;
  final String? trailingIconPath;
  final String title;
  final String? subtitle;
  final TextStyle? titleTextStyle;
  final GestureTapCallback? onTab;
  final bool? setDefaultIconColor;
  final Color? iconColor;
  final bool? setDefaultTrailingIconColor;
  final bool hasTileColor;
  final bool hasBorder;
  final BorderRadiusGeometry? borderRadius;
  final Widget? widgetInFrontOfTheTitle;
  final Widget? trailingWidget;
  final EdgeInsetsGeometry? contentPadding;
  final double? iconSize;
  final Widget? leading;
  final TextStyle? subtitleTextStyle;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(Dimens.corners),
          color:
              hasTileColor
                  ? checkDarkMode(context)
                      ? AppColors.darkBackgroundColor
                      : AppColors.descriptionColor
                  : Colors.transparent,
          border: hasBorder ? Border.all(color: AppColors.borderColor) : null,
        ),
        child: ListTile(
          contentPadding: contentPadding,
          title: Row(
            children: [
              Text(title),
              if (widgetInFrontOfTheTitle != null) ...<Widget>[
                const AppHSpace(space: Dimens.base),
                widgetInFrontOfTheTitle!,
              ],
            ],
          ),
          subtitle:
              subtitle == null
                  ? null
                  : Padding(
                    padding: const EdgeInsets.only(top: Dimens.padding),
                    child: Text(subtitle ?? '', style: subtitleTextStyle),
                  ),
          leading:
              leading ??
              (iconPath == null
                  ? null
                  : Padding(
                    padding: const EdgeInsets.only(top: Dimens.base / 2),
                    child: AppSvgViewer(
                      iconPath!,
                      width: iconSize ?? Dimens.veryLargePadding,
                      height: iconSize ?? Dimens.veryLargePadding,
                      setDefaultColor: setDefaultIconColor ?? true,
                      color: iconColor,
                    ),
                  )),
          trailing:
              trailingWidget ??
              (trailingIconPath != null
                  ? Padding(
                    padding: const EdgeInsets.only(top: Dimens.base / 2),
                    child: AppSvgViewer(
                      trailingIconPath!,
                      height: 24,
                      setDefaultColor: setDefaultTrailingIconColor ?? true,
                    ),
                  )
                  : null),
        ),
      ),
    );
  }
}
