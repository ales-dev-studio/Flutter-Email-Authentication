import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_authentication_screens_ui/core/utils/sized_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/localization/i18n/translations.g.dart';
import '../../../../../core/routes/go_routes_path.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/dimens.dart';
import '../../../../../core/utils/app_snack_bar.dart';
import '../../../../../core/utils/locale_handler.dart';
import '../../../../../core/widgets/app_bottom_sheet_dialog.dart';
import '../../../../../core/widgets/app_divider.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/app_space.dart';
import '../../../../../core/widgets/app_svg_viewer.dart';
import '../../../../../core/widgets/buttons/app_button.dart';
import '../../../../../core/widgets/lists/app_single_child_scroll_view.dart';
import '../../../../../core/widgets/menu_list_tile.dart';
import '../../../../../core/widgets/selected_check_widget.dart';
import '../../../../../core/widgets/user_profile_image.dart';
import '../../../../authentication/data/data_source/local/auth_storage.dart';
import '../../bloc/theme_cubit.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showPageGradient: true,
      padding: EdgeInsets.zero,
      smallBody: Column(
        children: [
          AppVSpace(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.largePadding,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: AppSingleChildScrollView(
                      child: Column(
                        spacing: Dimens.largePadding,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserProfileImage(),
                          Text('Ales Dev', style: TextStyle(fontSize: 28)),
                          Column(
                            spacing: Dimens.padding,
                            children: [
                              AppDivider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ProfileStat(
                                    title: t.followers,
                                    value: '12k',
                                    onTap: () {},
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: AppDivider(verticalDivider: true),
                                  ),
                                  ProfileStat(
                                    title: t.following,
                                    value: '226',
                                    onTap: () {},
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: AppDivider(verticalDivider: true),
                                  ),
                                  ProfileStat(
                                    title: t.events,
                                    value: '38',
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              AppVSpace(space: Dimens.smallPadding),
                              AppDivider(),
                            ],
                          ),
                          Column(
                            spacing: Dimens.padding,
                            children: [
                              ProfileListTile(
                                title: t.profile,
                                leadingIconPath: Assets.icons.userIcon,
                                onTap: () {
                                  context.pushNamed(GoRoutesPath.editProfile);
                                },
                              ),
                              ProfileListTile(
                                title: t.security,
                                leadingIconPath: Assets.icons.securityIcon,
                                onTap: () {},
                              ),
                              ProfileListTile(
                                title: t.language,
                                leadingIconPath: Assets.icons.languageIcon,
                                onTap: () {
                                  changeLanguageDialog(context);
                                },
                              ),
                              ProfileListTile(
                                title: t.theme,
                                leadingIconPath: Assets.icons.darkModeIcon,
                                onTap: () {
                                  changeThemeDialog(context);
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  logoutDialog(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: Dimens.largePadding,
                                    horizontal:
                                        checkEnState(context)
                                            ? Dimens.mediumPadding
                                            : Dimens.smallPadding,
                                  ),
                                  child: Row(
                                    spacing:
                                        checkEnState(context)
                                            ? Dimens.largePadding
                                            : Dimens.veryLargePadding,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppSvgViewer(
                                        Assets.icons.logoutIcon,
                                        setDefaultColor: false,
                                        color: AppColors.redColor,
                                      ),
                                      Text(
                                        t.logout,
                                        style: TextStyle(
                                          color: AppColors.redColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              AppVSpace(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.leadingIconPath,
    required this.onTap,
  });

  final String title;
  final String leadingIconPath;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.largePadding,
          horizontal: Dimens.padding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: Dimens.veryLargePadding,
              children: [AppSvgViewer(leadingIconPath), Text(title)],
            ),
            Icon(Icons.arrow_forward_ios, size: 15),
          ],
        ),
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  const ProfileStat({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
  });

  final String title;
  final String value;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(Dimens.padding),
        child: Column(
          spacing: Dimens.padding,
          children: [Text(value, style: TextStyle(fontSize: 32)), Text(title)],
        ),
      ),
    );
  }
}

void changeThemeDialog(final BuildContext context) {
  appModalBottomSheetDialog(
    context,
    t.theme,
    '',
    child: Column(
      children: [
        MenuListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding,
          ),
          title: t.systemDefault,
          onTab: () {
            context.pop();
            Timer(Duration(milliseconds: 500), () {
              context.read<ThemeCubit>().setSystemDefault();
            });
          },
          trailingWidget:
              BlocProvider.of<ThemeCubit>(context).state == ThemeMode.system ||
                      BlocProvider.of<ThemeCubit>(context).state == null
                  ? const SelectedCheckWidget()
                  : null,
        ),
        MenuListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding,
          ),
          title: t.mDay,
          onTab: () {
            context.pop();
            Timer(Duration(milliseconds: 500), () {
              context.read<ThemeCubit>().setLightMode();
            });
          },
          trailingWidget:
              BlocProvider.of<ThemeCubit>(context).state == ThemeMode.light
                  ? const SelectedCheckWidget()
                  : null,
        ),
        MenuListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding,
          ),
          title: t.mNight,
          onTab: () {
            context.pop();
            Timer(Duration(milliseconds: 500), () {
              context.read<ThemeCubit>().setDarkMode();
            });
          },
          trailingWidget:
              BlocProvider.of<ThemeCubit>(context).state == ThemeMode.dark
                  ? const SelectedCheckWidget()
                  : null,
        ),
        const AppVSpace(),
      ],
    ),
  );
}

void changeLanguageDialog(final BuildContext context) {
  appModalBottomSheetDialog(
    context,
    t.language,
    '',
    child: Column(
      children: [
        MenuListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding,
          ),
          title: t.farsi,
          setDefaultIconColor: false,
          onTab: () {
            context.pop();
            Timer(Duration(milliseconds: 500), () {
              LocaleHandler().setFaLocale(context);
            });
          },
          trailingWidget:
              !checkEnState(context) ? const SelectedCheckWidget() : null,
        ),
        MenuListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding,
          ),
          title: t.english,
          setDefaultIconColor: false,
          onTab: () {
            context.pop();
            Timer(Duration(milliseconds: 500), () {
              LocaleHandler().setEnLocale(context);
            });
          },
          trailingWidget:
              checkEnState(context) ? const SelectedCheckWidget() : null,
        ),
        const AppVSpace(),
      ],
    ),
  );
}

void logoutDialog(final BuildContext context) {
  appModalBottomSheetDialog(
    context,
    t.logout,
    t.messLogout,
    showDragHandle: true,
    child: Center(
      child: Column(
        spacing: Dimens.largePadding,
        children: [
          const AppVSpace(space: Dimens.largePadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.widthPx > 400 ? 160 : 130,
                height: 50,
                child: AppButton(
                  title: t.no,
                  color: AppColors.borderColor,
                  onPressed: () {
                    context.pop();
                  },
                  verticalMargin: 0,
                ),
              ),
              SizedBox(
                width: context.widthPx > 400 ? 160 : 130,
                height: 50,
                child: AppButton(
                  title: t.yes,
                  onPressed: () async {
                    try {
                      AuthStorage().saveEmailVerificationStatus(false);
                      AuthStorage().clearToken();
                      context.goNamed(GoRoutesPath.authentication);
                      context.pop();
                    } catch (e) {
                      context.pop();
                      showSnackBar(
                        t.throwException,
                        snackBarType: SnackBarType.error,
                      );
                    }
                  },
                  verticalMargin: 0,
                  color: AppColors.orangeColor,
                ),
              ),
            ],
          ),
          const AppVSpace(),
        ],
      ),
    ),
  );
}
