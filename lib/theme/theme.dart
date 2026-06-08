import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizz/theme/colors.dart';

class Theme {
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bg1Start,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent1,
        secondary: AppColors.accent2,
        surface: Color(0xFF1E0A16),
        error: AppColors.accentRed,
      ),

      textTheme: TextTheme(
        // Головний заголовок — Playfair italic
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 28,
          fontStyle: FontStyle.italic,
          color: AppColors.textPrimary,
          letterSpacing: 0.01,
        ),
        // Питання на екрані 1
        headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontStyle: FontStyle.italic,
          color: AppColors.textPrimary,
          height: 1.4,
        ),
        // Заголовок Screen 2
        headlineSmall: GoogleFonts.playfairDisplay(
          fontSize: 20,
          color: AppColors.text2Primary,
          height: 1.2,
        ),
        // Основний текст
        bodyLarge: GoogleFonts.dmSans(
          fontSize: 15,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w400,
        ),
        // Підписи, label-и
        bodySmall: GoogleFonts.dmSans(
          fontSize: 11,
          color: AppColors.textMuted,
          letterSpacing: 0.08,
        ),
        // Кнопки
        labelLarge: GoogleFonts.dmSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.03,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          textStyle: GoogleFonts.dmSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.03,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withOpacity(0.04),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.cardBorder, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.cardBorder.withOpacity(0.6),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.accent2, width: 1),
        ),
        hintStyle: GoogleFonts.dmSans(
          fontSize: 13,
          color: AppColors.text2Muted,
          fontStyle: FontStyle.italic,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: Colors.white.withOpacity(0.04),
        selectedColor: AppColors.accent2.withOpacity(0.25),
        labelStyle: GoogleFonts.dmSans(
          fontSize: 11,
          color: AppColors.text2Muted,
        ),
        side: BorderSide(
          color: AppColors.cardBorder.withOpacity(0.5),
          width: 0.5,
        ),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      ),

      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
