import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData buildDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark, // Explicitly set the theme to dark
    primaryColor: PRIMARY_COLOR,
    scaffoldBackgroundColor: BACKGROUND_COLOR,
    canvasColor: BACKGROUND_COLOR,

    // Ensure ColorScheme brightness matches ThemeData brightness
    colorScheme: const ColorScheme.dark(
      primary: PRIMARY_COLOR,
      secondary: ACCENT_COLOR,
      background: BACKGROUND_COLOR,
      surface: CARD_COLOR,
      onPrimary: TEXT_COLOR,
      onSecondary: TEXT_COLOR,
      onBackground: TEXT_COLOR,
      onSurface: TEXT_COLOR,
    ),

    // Text Theme
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: TEXT_COLOR, fontSize: 14.0),
      bodyMedium: TextStyle(color: TEXT_COLOR, fontSize: 16.0),
      displayLarge: TextStyle(color: TEXT_COLOR, fontSize: 32.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: TEXT_COLOR, fontSize: 18.0, fontWeight: FontWeight.w600),
    ),

    // Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: PRIMARY_COLOR,
        padding: const EdgeInsets.symmetric(vertical: PADDING),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BORDER_RADIUS),
        ),
      ),
    ),

    // Card Theme
    cardTheme: CardTheme(
      color: CARD_COLOR,
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BORDER_RADIUS)),
    ),

    // Input Decoration Theme (TextFields)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: CARD_COLOR,
      hintStyle: const TextStyle(color: Colors.white70),
      contentPadding: const EdgeInsets.symmetric(horizontal: PADDING, vertical: 14.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
        borderSide: BorderSide.none,
      ),
    ),

    // SnackBar Theme
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.green,
      contentTextStyle: TextStyle(color: TEXT_COLOR),
    ),
  );
}