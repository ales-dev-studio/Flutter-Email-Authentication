import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/dimens.dart';
import '../../core/theme/typography.dart';
import '../../core/utils/locale_handler.dart';

class AppTheme {
  AppTheme(final BuildContext context) {
    final Color primaryColor = AppColors.primaryColor;
    lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        surface: AppColors.whiteColor,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.whiteColor,
        iconTheme: WidgetStateProperty.resolveWith((
          final Set<WidgetState> state,
        ) {
          if (state.contains(WidgetState.selected)) {
            return IconThemeData(color: primaryColor);
          }
          return IconThemeData(color: AppColors.textColor);
        }),
      ),
      navigationRailTheme: NavigationRailThemeData(
        selectedLabelTextStyle:
            checkEnState(context)
                ? AppTypography(
                  darkStatus: true,
                ).jaldiTextTheme.labelMedium!.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                )
                : AppTypography(
                  darkStatus: false,
                ).vazirmatnTextTheme.labelMedium!.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
        unselectedLabelTextStyle:
            checkEnState(context)
                ? AppTypography(darkStatus: true).jaldiTextTheme.labelMedium!
                    .copyWith(color: AppColors.whiteColor)
                : AppTypography(darkStatus: true)
                    .vazirmatnTextTheme
                    .labelMedium!
                    .copyWith(color: AppColors.whiteColor),
      ),
      textTheme:
          checkEnState(context)
              ? AppTypography(darkStatus: false).jaldiTextTheme
              : AppTypography(darkStatus: false).vazirmatnTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle:
            checkEnState(context)
                ? AppTypography(darkStatus: false).jaldiTextTheme.titleLarge
                : AppTypography(
                  darkStatus: false,
                ).vazirmatnTextTheme.titleLarge,
      ),
      scaffoldBackgroundColor: AppColors.whiteColor,
      bottomSheetTheme: BottomSheetThemeData(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        constraints: BoxConstraints(
          maxWidth: Dimens.mediumDeviceBreakPoint + 1,
        ),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle:
            checkEnState(context)
                ? AppTypography(darkStatus: false).jaldiTextTheme.bodyLarge
                : AppTypography(
                  darkStatus: false,
                ).vazirmatnTextTheme.bodyMedium,
      ),
    );

    darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        surface: AppColors.whiteColor,
        onSurface: Colors.black,
        primaryContainer: AppColors.darkBackgroundColor,
      ),
      navigationBarTheme: NavigationBarThemeData(
        iconTheme: WidgetStateProperty.resolveWith((
          final Set<WidgetState> state,
        ) {
          if (state.contains(WidgetState.selected)) {
            return IconThemeData(color: primaryColor);
          }
          return IconThemeData(color: AppColors.textColor);
        }),
      ),
      navigationRailTheme: NavigationRailThemeData(
        selectedLabelTextStyle:
            checkEnState(context)
                ? AppTypography(
                  darkStatus: true,
                ).jaldiTextTheme.labelMedium!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                )
                : AppTypography(
                  darkStatus: false,
                ).vazirmatnTextTheme.labelMedium!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
        unselectedLabelTextStyle:
            checkEnState(context)
                ? AppTypography(
                  darkStatus: true,
                ).jaldiTextTheme.labelMedium!.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                )
                : AppTypography(
                  darkStatus: true,
                ).vazirmatnTextTheme.labelMedium!.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
      ),
      textTheme:
          checkEnState(context)
              ? AppTypography(darkStatus: true).jaldiTextTheme
              : AppTypography(darkStatus: true).vazirmatnTextTheme,
      appBarTheme: AppBarTheme(
        color: AppColors.darkScaffoldBackgroundColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle:
            checkEnState(context)
                ? AppTypography(darkStatus: true).jaldiTextTheme.titleLarge
                : AppTypography(darkStatus: true).vazirmatnTextTheme.titleLarge,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.darkScaffoldBackgroundColor,
        elevation: 0,
        constraints: BoxConstraints(
          maxWidth: Dimens.mediumDeviceBreakPoint + 1,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(elevation: 0),
      listTileTheme: ListTileThemeData(
        titleTextStyle:
            checkEnState(context)
                ? AppTypography(darkStatus: true).jaldiTextTheme.bodyLarge
                : AppTypography(darkStatus: true).vazirmatnTextTheme.bodyMedium,
      ),
    );
  }

  late ThemeData lightTheme;
  late ThemeData darkTheme;
}
