import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/core/constants/app_constants.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      platform: TargetPlatform.android,
      scaffoldBackgroundColor: kBackgroundColor,
      primaryColor: kPrimaryColor,
      canvasColor: kBackgroundColor,
      cardColor: kCardColor,
      colorScheme: const ColorScheme.dark(
        primary: kPrimaryColor,
        secondary: kDangerColor,
        surface: kSurfaceColor,
      ),
      textTheme: GoogleFonts.latoTextTheme(
        ThemeData.dark().textTheme,
      ),
      useMaterial3: true,
    );
  }
}
