import 'package:flutter/material.dart';
import 'package:rizz/theme/colors.dart';

class ThemeButton {
  // Кнопка YES
  static final ButtonStyle yesStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accentGreen,
    foregroundColor: const Color(0xFF1A3A1E),
    shadowColor: AppColors.accentGreen.withOpacity(0.4),
    elevation: 8,
    shape: const StadiumBorder(),
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
  );

  // Кнопка NO
  static final ButtonStyle noStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accentRed,
    foregroundColor: Colors.white,
    shadowColor: AppColors.accentRed.withOpacity(0.35),
    elevation: 6,
    shape: const StadiumBorder(),
    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
  );

  // Кнопка Telegram (Screen 2)
  static final ButtonStyle telegramStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accent2,
    foregroundColor: Colors.white,
    shadowColor: AppColors.accent2.withOpacity(0.4),
    elevation: 10,
    shape: const StadiumBorder(),
    padding: const EdgeInsets.symmetric(vertical: 16),
  );
}
