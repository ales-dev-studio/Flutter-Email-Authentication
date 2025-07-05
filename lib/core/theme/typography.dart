import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/colors.dart';

class AppTypography {
  AppTypography({required this.darkStatus});

  final bool darkStatus;

  // Define a custom TextTheme using jaldi font
  TextTheme get jaldiTextTheme {
    Color color = darkStatus ? AppColors.whiteColor : AppColors.textColor;

    return TextTheme(
      // Display Large: Used for the largest headlines
      displayLarge: GoogleFonts.jaldi(
        fontSize: 50, // Font size for displayLarge
        fontWeight: FontWeight.w700, // Regular weight
        color: color,
      ),
      // Display Medium: Slightly smaller than displayLarge
      displayMedium: GoogleFonts.jaldi(
        fontSize: 45, // Font size for displayMedium
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Display Small: Smaller than displayMedium
      displaySmall: GoogleFonts.jaldi(
        fontSize: 36, // Font size for displaySmall
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Headline Large: Used for major headings
      headlineLarge: GoogleFonts.jaldi(
        fontSize: 32, // Font size for headlineLarge
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Headline Medium: Slightly smaller than headlineLarge
      headlineMedium: GoogleFonts.jaldi(
        fontSize: 28, // Font size for headlineMedium
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Headline Small: Smaller than headlineMedium
      headlineSmall: GoogleFonts.jaldi(
        fontSize: 24, // Font size for headlineSmall
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Title Large: Used for large titles
      titleLarge: GoogleFonts.jaldi(
        fontSize: 22, // Font size for titleLarge
        fontWeight: FontWeight.w500, // Medium weight
        color: color,
      ),
      // Title Medium: Used for medium-sized titles
      titleMedium: GoogleFonts.jaldi(
        fontSize: 16, // Font size for titleMedium
        fontWeight: FontWeight.w700, // Medium weight
        color: color,
      ),
      // Title Small: Used for small titles
      titleSmall: GoogleFonts.jaldi(
        fontSize: 14, // Font size for titleSmall
        fontWeight: FontWeight.w500, // Medium weight
        color: color,
      ),
      // Body Large: Used for large body text
      bodyLarge: GoogleFonts.jaldi(
        fontSize: 16, // Font size for bodyLarge
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Body Medium: Used for standard body text
      bodyMedium: GoogleFonts.jaldi(
        fontSize: 14, // Font size for bodyMedium
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Body Small: Used for small body text
      bodySmall: GoogleFonts.jaldi(
        fontSize: 12, // Font size for bodySmall
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Label Large: Used for large labels (e.g., buttons)
      labelLarge: GoogleFonts.jaldi(
        fontSize: 14, // Font size for labelLarge
        fontWeight: FontWeight.w500, // Medium weight
        color: color,
      ),
      // Label Medium: Used for medium-sized labels
      labelMedium: GoogleFonts.jaldi(
        fontSize: 12, // Font size for labelMedium
        fontWeight: FontWeight.w500, // Medium weight
        color: color,
      ),
      // Label Small: Used for small labels
      labelSmall: GoogleFonts.jaldi(
        fontSize: 11, // Font size for labelSmall
        fontWeight: FontWeight.w500, // Medium weight
        color: color,
      ),
    );
  }

  // Define a custom TextTheme using vazirmatn font
  TextTheme get vazirmatnTextTheme {
    Color color = darkStatus ? AppColors.whiteColor : AppColors.textColor;

    return TextTheme(
      // Display Large: Used for the largest headlines
      displayLarge: GoogleFonts.vazirmatn(
        fontSize: 50, // Font size for displayLarge
        fontWeight: FontWeight.w700, // Regular weight
        color: color,
      ),
      // Display Medium: Slightly smaller than displayLarge
      displayMedium: GoogleFonts.vazirmatn(
        fontSize: 45, // Font size for displayMedium
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Display Small: Smaller than displayMedium
      displaySmall: GoogleFonts.vazirmatn(
        fontSize: 36, // Font size for displaySmall
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Headline Large: Used for major headings
      headlineLarge: GoogleFonts.vazirmatn(
        fontSize: 32, // Font size for headlineLarge
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Headline Medium: Slightly smaller than headlineLarge
      headlineMedium: GoogleFonts.vazirmatn(
        fontSize: 28, // Font size for headlineMedium
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Headline Small: Smaller than headlineMedium
      headlineSmall: GoogleFonts.vazirmatn(
        fontSize: 24, // Font size for headlineSmall
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Title Large: Used for large titles
      titleLarge: GoogleFonts.vazirmatn(
        fontSize: 22, // Font size for titleLarge
        fontWeight: FontWeight.w500, // Medium weight
        color: color,
      ),
      // Title Medium: Used for medium-sized titles
      titleMedium: GoogleFonts.vazirmatn(
        fontSize: 16, // Font size for titleMedium
        fontWeight: FontWeight.w700, // Medium weight
        color: color,
      ),
      // Title Small: Used for small titles
      titleSmall: GoogleFonts.vazirmatn(
        fontSize: 14, // Font size for titleSmall
        fontWeight: FontWeight.w500, // Medium weight
        color: color,
      ),
      // Body Large: Used for large body text
      bodyLarge: GoogleFonts.vazirmatn(
        fontSize: 16, // Font size for bodyLarge
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Body Medium: Used for standard body text
      bodyMedium: GoogleFonts.vazirmatn(
        fontSize: 14, // Font size for bodyMedium
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Body Small: Used for small body text
      bodySmall: GoogleFonts.vazirmatn(
        fontSize: 12, // Font size for bodySmall
        fontWeight: FontWeight.w400, // Regular weight
        color: color,
      ),
      // Label Large: Used for large labels (e.g., buttons)
      labelLarge: GoogleFonts.vazirmatn(
        fontSize: 14, // Font size for labelLarge
        fontWeight: FontWeight.w500, // Medium weight
        color: color,
      ),
      // Label Medium: Used for medium-sized labels
      labelMedium: GoogleFonts.vazirmatn(
        fontSize: 12, // Font size for labelMedium
        fontWeight: FontWeight.w500, // Medium weight
        color: color,
      ),
      // Label Small: Used for small labels
      labelSmall: GoogleFonts.vazirmatn(
        fontSize: 11, // Font size for labelSmall
        fontWeight: FontWeight.w500, // Medium weight
        color: color,
      ),
    );
  }
}