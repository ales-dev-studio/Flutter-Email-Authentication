import 'package:flutter/material.dart';
import 'package:flutter_authentication_screens_ui/features/authentication/presentation/widgets/sso_logo_widget.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/utils/check_theme_status.dart';
import '../../../../core/widgets/app_divider.dart';

class ContinueWithSsoWidget extends StatelessWidget {
  const ContinueWithSsoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Dimens.largePadding,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.veryLargePadding,
          ),
          child: Row(
            spacing: Dimens.largePadding,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: AppDivider()),
              Text(t.continueWith),
              Expanded(child: AppDivider()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Dimens.smallPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: Dimens.largePadding,
            children: [
              SsoLogoWidget(
                logoPath: Assets.icons.googleIcon,
                color:
                    checkDarkMode(context)
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                title: t.google,
              ),
              SsoLogoWidget(
                logoPath: Assets.icons.appleIcon,
                title: t.apple,
                color:
                    checkDarkMode(context)
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
