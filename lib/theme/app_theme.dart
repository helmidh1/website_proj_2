import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Theme Colors
  static const Color primaryLight = Color(0xFF14B8A6); // Teal-500
  static const Color backgroundLight = Color(0xFFF6F6F8);
  static const Color surfaceLight = Colors.white;
  static const Color textPrimaryLight = Color(0xFF0F172A); // Slate-900
  static const Color textSecondaryLight = Color(0xFF475569); // Slate-600

  // Dark Theme Colors
  static const Color primaryDark = Color(0xFF14B8A6); // Teal-500
  static const Color backgroundDark = Color(0xFF020617); // Slate-950
  static const Color surfaceDark = Color(0xFF0F172A); // Slate-900
  static const Color textPrimaryDark = Color(0xFFCBD5E1); // Slate-300
  static const Color textSecondaryDark = Color(0xFF94A3B8); // Slate-400

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: primaryLight,
        background: backgroundLight,
        surface: surfaceLight,
        onBackground: textPrimaryLight,
        onSurface: textPrimaryLight,
      ),
      scaffoldBackgroundColor: backgroundLight,
      textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme)
          .copyWith(
            displayLarge: GoogleFonts.inter(
              fontSize: 72,
              fontWeight: FontWeight.w900,
              color: textPrimaryLight,
              height: 1.1,
            ),
            displayMedium: GoogleFonts.inter(
              fontSize: 60,
              fontWeight: FontWeight.w900,
              color: textPrimaryLight,
              height: 1.1,
            ),
            displaySmall: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: textPrimaryLight,
              height: 1.1,
            ),
            headlineMedium: GoogleFonts.inter(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: textPrimaryLight,
              height: 1.2,
            ),
            bodyLarge: GoogleFonts.inter(
              fontSize: 18,
              color: textSecondaryLight,
              height: 1.6,
            ),
            bodyMedium: GoogleFonts.inter(
              fontSize: 16,
              color: textSecondaryLight,
              height: 1.6,
            ),
            labelLarge: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textPrimaryLight,
            ),
          ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: primaryDark,
        background: backgroundDark,
        surface: surfaceDark,
        onBackground: textPrimaryDark,
        onSurface: textPrimaryDark,
      ),
      scaffoldBackgroundColor: backgroundDark,
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)
          .copyWith(
            displayLarge: GoogleFonts.inter(
              fontSize: 72,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.1,
            ),
            displayMedium: GoogleFonts.inter(
              fontSize: 60,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.1,
            ),
            displaySmall: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.1,
            ),
            headlineMedium: GoogleFonts.inter(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
            bodyLarge: GoogleFonts.inter(
              fontSize: 18,
              color: textPrimaryDark,
              height: 1.6,
            ),
            bodyMedium: GoogleFonts.inter(
              fontSize: 16,
              color: textPrimaryDark,
              height: 1.6,
            ),
            labelLarge: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
    );
  }
}
