import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeDefault {
  static ThemeData themeDefault(BuildContext context) {
    return ThemeData(
      primaryColor: Color(0xFF3E82FC),
      accentColor: Color(0xFFFE2C54),
      textTheme: GoogleFonts.robotoCondensedTextTheme(
        Theme.of(context).textTheme,
      ),
    );
  }
}
