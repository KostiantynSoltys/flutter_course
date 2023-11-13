import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var myColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 243, 224));

ThemeData myTheme() {
  return ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: myColorScheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: myColorScheme.primaryContainer,
        foregroundColor: myColorScheme.onSecondaryContainer,
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
          bodyLarge: TextStyle(
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontWeight: FontWeight.normal,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 20,
          ),
          bodyMedium: TextStyle(
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontWeight: FontWeight.normal,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
          bodySmall: TextStyle(
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontWeight: FontWeight.normal,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 14,
          ),
          labelSmall: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontWeight: FontWeight.bold,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
          titleLarge: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontWeight: FontWeight.normal,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 25,
          ),
        ),
  );
}