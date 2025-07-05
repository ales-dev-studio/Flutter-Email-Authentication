import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_screens_ui/core/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../../../core/routes/go_routes_path.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/utils/check_desktop_size.dart';
import '../../../../core/utils/check_platforms.dart';
import '../../../../core/utils/check_theme_status.dart';
import '../../../../core/utils/full_screen_dialog.dart';
import '../../../../core/utils/url_launcher.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_space.dart';
import '../../../../core/widgets/app_web_view_widget.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/typography/app_title_large_text.dart';
import '../bloc/authentication_cubit.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showPageGradient: true,
      smallBody: FadeInDown(
        child: Column(
          spacing: Dimens.largePadding,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                AppVSpace(
                  space:
                      checkVerySmallDeviceSize(context)
                          ? Dimens.padding
                          : Dimens.largePadding,
                ),
                SizedBox(
                  width: 250.0,
                  child: Image.asset(
                    Assets.images.authentication.path,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: Dimens.padding,
              children: [
                AppTitleLargeText(t.letsGetStarted),
                Text(
                  t.authDesc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        checkDarkMode(context)
                            ? AppColors.descriptionColor
                            : null,
                  ),
                ),
                const AppVSpace(space: Dimens.padding),
                Column(
                  spacing: Dimens.padding,
                  children: [
                    AppButton(
                      title: t.continueWithEmail,
                      onPressed: () async {
                        context.goNamed(GoRoutesPath.signIn);
                      },
                    ),
                    AppButton(
                      title: t.continueWithGoogle,
                      onPressed: () {
                        context.read<AuthenticationCubit>().authWithGoogle(
                          onSuccess: () {},
                        );
                      },
                      color:
                          checkDarkMode(context)
                              ? AppColors.lightBlackColor
                              : null,
                    ),
                  ],
                ),
                const AppVSpace(space: Dimens.largePadding),
                Text(t.acceptTC),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: Dimens.smallPadding,
                  children: [
                    GestureDetector(
                      onTap: () {
                        final String termOfServiceUrl =
                            'https://www.google.com/';
                        if (PlatformChecker.isWeb()) {
                          launchURL(termOfServiceUrl);
                          return;
                        }
                        appFullscreenDialog(
                          context,
                          AppWebViewWidget(
                            url: termOfServiceUrl,
                            title: t.termsOfService,
                          ),
                        );
                      },
                      child: Text(
                        t.termsOfService,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                    Text(t.and),
                    GestureDetector(
                      onTap: () {
                        final String privacyPolicy = 'https://www.google.com/';
                        if (PlatformChecker.isWeb()) {
                          launchURL(privacyPolicy);
                          return;
                        }
                        appFullscreenDialog(
                          context,
                          AppWebViewWidget(
                            url: privacyPolicy,
                            title: t.privacyPolicy,
                          ),
                        );
                      },
                      child: Text(
                        t.privacyPolicy,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                AppVSpace(space: Dimens.padding),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
