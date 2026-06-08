import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rizz/gen/colors.gen.dart';

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorName.roseBackgroundStart,
      colorScheme: const ColorScheme.dark(
        primary: ColorName.roseAccent,
        secondary: ColorName.purpleAccent,
        surface: ColorName.surface,
        error: ColorName.accentRed,
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
