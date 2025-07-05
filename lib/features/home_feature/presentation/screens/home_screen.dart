import 'package:flutter/material.dart';
import 'package:flutter_authentication_screens_ui/core/utils/sized_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/utils/check_theme_status.dart';
import '../../../../core/widgets/app_main_navigation.dart';
import '../../../../core/widgets/app_svg_viewer.dart';
import '../bloc/bottom_navigation_cubit.dart';
import '../widgets/tabs/explore_tab.dart';
import '../widgets/tabs/favorites_tab.dart';
import '../widgets/tabs/home_tab.dart';
import '../widgets/tabs/profile_tab.dart';
import '../widgets/tabs/tickets_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final watch = context.watch<BottomNavigationCubit>();
    final List<Widget> pages = [
      HomeTab(),
      ExploreTab(),
      FavoritesTab(),
      TicketsTab(),
      ProfileTab(),
    ];
    return AppMainNavigation(
      body: IndexedStack(
        index: context.watch<BottomNavigationCubit>().state,
        children: pages,
      ),
      navigationRail: SizedBox(
        height: context.sizePx.height,
        child: NavigationRail(
          onDestinationSelected: (final int index) {
            context.read<BottomNavigationCubit>().onDestinationSelected(index);
          },
          indicatorColor: Colors.transparent,
          selectedIndex: context.watch<BottomNavigationCubit>().state,
          labelType: NavigationRailLabelType.all,
          backgroundColor:
              checkDarkMode(context)
                  ? AppColors.cardColor
                  : AppColors.primaryColor,
          destinations: <NavigationRailDestination>[
            NavigationRailDestination(
              padding: EdgeInsets.only(top: Dimens.largePadding),
              selectedIcon: AppSvgViewer(
                Assets.icons.home,
                color:
                    checkDarkMode(context)
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                width: 24,
                setDefaultWidthAndHeight: false,
                setDefaultColor: false,
              ),
              icon: AppSvgViewer(
                Assets.icons.home,
                width: 24,
                setDefaultWidthAndHeight: false,
                setDefaultColor: checkDarkMode(context),
                color: AppColors.whiteColor,
              ),
              label: Text(t.home),
            ),
            NavigationRailDestination(
              padding: EdgeInsets.only(top: Dimens.largePadding),
              selectedIcon: AppSvgViewer(
                Assets.icons.game,
                color:
                    checkDarkMode(context)
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                width: 24,
                setDefaultWidthAndHeight: false,
                setDefaultColor: false,
              ),
              icon: AppSvgViewer(
                Assets.icons.game,
                width: 24,
                setDefaultWidthAndHeight: false,
                setDefaultColor: checkDarkMode(context),
                color: AppColors.whiteColor,
              ),
              label: Text(t.explore),
            ),
            NavigationRailDestination(
              padding: EdgeInsets.only(top: Dimens.largePadding),
              selectedIcon: AppSvgViewer(
                Assets.icons.favorites,
                color:
                    checkDarkMode(context)
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                width: 24,
                setDefaultWidthAndHeight: false,
                setDefaultColor: false,
              ),
              icon: AppSvgViewer(
                Assets.icons.favorites,
                width: 24,
                setDefaultWidthAndHeight: false,
                setDefaultColor: checkDarkMode(context),
                color: AppColors.whiteColor,
              ),
              label: Text(t.favorite),
            ),
            NavigationRailDestination(
              padding: EdgeInsets.only(top: Dimens.largePadding),
              selectedIcon: AppSvgViewer(
                Assets.icons.happy,
                color:
                    checkDarkMode(context)
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                width: 24,
                setDefaultWidthAndHeight: false,
                setDefaultColor: false,
              ),
              icon: AppSvgViewer(
                Assets.icons.happy,
                width: 24,
                setDefaultWidthAndHeight: false,
                setDefaultColor: checkDarkMode(context),
                color: AppColors.whiteColor,
              ),
              label: Text(t.tickets),
            ),
            NavigationRailDestination(
              padding: EdgeInsets.only(top: Dimens.largePadding),
              selectedIcon: AppSvgViewer(
                Assets.icons.userBordered,
                color:
                    checkDarkMode(context)
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                width: 24,
                setDefaultWidthAndHeight: false,
                setDefaultColor: false,
              ),
              icon: AppSvgViewer(
                Assets.icons.userBordered,
                width: 24,
                setDefaultWidthAndHeight: false,
                setDefaultColor: checkDarkMode(context),
                color: AppColors.whiteColor,
              ),
              label: Text(t.profile),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.corners),
          topRight: Radius.circular(Dimens.corners),
        ),
        child: BottomNavigationBar(
          backgroundColor:
              checkDarkMode(context)
                  ? AppColors.cardColor
                  : AppColors.primaryColor,
          currentIndex: context.watch<BottomNavigationCubit>().state,
          onTap: (final int index) {
            context.read<BottomNavigationCubit>().onDestinationSelected(index);
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor:
              checkDarkMode(context)
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
          unselectedItemColor:
              checkDarkMode(context)
                  ? AppColors.descriptionColor
                  : AppColors.whiteColor.withValues(alpha: 0.6),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(
                  top: Dimens.padding,
                  bottom: Dimens.padding,
                ),
                child: AppSvgViewer(
                  Assets.icons.home,
                  color:
                      watch.state == 0
                          ? (checkDarkMode(context)
                              ? AppColors.primaryColor
                              : AppColors.whiteColor)
                          : (checkDarkMode(context)
                              ? AppColors.descriptionColor
                              : AppColors.whiteColor.withValues(alpha: 0.6)),
                  width: 24,
                  setDefaultWidthAndHeight: false,
                  setDefaultColor: false,
                ),
              ),
              label: t.home,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(
                  top: Dimens.padding,
                  bottom: Dimens.padding,
                ),
                child: AppSvgViewer(
                  Assets.icons.game,
                  color:
                      watch.state == 1
                          ? (checkDarkMode(context)
                              ? AppColors.primaryColor
                              : AppColors.whiteColor)
                          : (checkDarkMode(context)
                              ? AppColors.descriptionColor
                              : AppColors.whiteColor.withValues(alpha: 0.6)),
                  width: 24,
                  setDefaultWidthAndHeight: false,
                  setDefaultColor: false,
                ),
              ),
              label: t.explore,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(
                  top: Dimens.padding,
                  bottom: Dimens.padding,
                ),
                child: AppSvgViewer(
                  Assets.icons.favorites,
                  color:
                      watch.state == 2
                          ? (checkDarkMode(context)
                              ? AppColors.primaryColor
                              : AppColors.whiteColor)
                          : (checkDarkMode(context)
                              ? AppColors.descriptionColor
                              : AppColors.whiteColor.withValues(alpha: 0.6)),
                  width: 24,
                  setDefaultWidthAndHeight: false,
                  setDefaultColor: false,
                ),
              ),
              label: t.favorite,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(
                  top: Dimens.padding,
                  bottom: Dimens.padding,
                ),
                child: AppSvgViewer(
                  Assets.icons.happy,
                  color:
                      watch.state == 3
                          ? (checkDarkMode(context)
                              ? AppColors.primaryColor
                              : AppColors.whiteColor)
                          : (checkDarkMode(context)
                              ? AppColors.descriptionColor
                              : AppColors.whiteColor.withValues(alpha: 0.6)),
                  width: 24,
                  setDefaultWidthAndHeight: false,
                  setDefaultColor: false,
                ),
              ),
              label: t.tickets,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(
                  top: Dimens.padding,
                  bottom: Dimens.padding,
                ),
                child: AppSvgViewer(
                  Assets.icons.userBordered,
                  color:
                      watch.state == 4
                          ? (checkDarkMode(context)
                              ? AppColors.primaryColor
                              : AppColors.whiteColor)
                          : (checkDarkMode(context)
                              ? AppColors.descriptionColor
                              : AppColors.whiteColor.withValues(alpha: 0.6)),
                  width: 24,
                  setDefaultWidthAndHeight: false,
                  setDefaultColor: false,
                ),
              ),
              label: t.profile,
            ),
          ],
        ),
      ),
    );
  }
}
