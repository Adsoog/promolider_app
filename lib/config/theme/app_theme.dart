import 'package:flutter/material.dart';
import 'package:promolider_app/config/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.notoSans().fontFamily,
    textTheme: GoogleFonts.notoSansTextTheme(),
    primaryTextTheme: GoogleFonts.notoSansTextTheme(),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: primaryColor,
      background: backgroundColor,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
    ),
  );
}
