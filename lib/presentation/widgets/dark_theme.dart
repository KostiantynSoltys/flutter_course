import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var myDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));

ThemeData myDarkTheme() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: myDarkColorScheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: myDarkColorScheme.background,
        foregroundColor: myDarkColorScheme.onSecondaryContainer,
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
          bodyLarge: TextStyle(
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontWeight: FontWeight.normal,
            color: myDarkColorScheme.onSecondaryContainer,
            fontSize: 20,
          ),
          bodyMedium: TextStyle(
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontWeight: FontWeight.normal,
            color: myDarkColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
          bodySmall: TextStyle(
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontWeight: FontWeight.normal,
            color: myDarkColorScheme.onSecondaryContainer,
            fontSize: 14,
          ),
          labelSmall: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontWeight: FontWeight.bold,
            color: myDarkColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
          titleLarge: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontWeight: FontWeight.normal,
            color: myDarkColorScheme.onSecondaryContainer,
            fontSize: 25,
          ),
        ),
  );
}
