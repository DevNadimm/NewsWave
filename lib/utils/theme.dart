import 'package:flutter/material.dart';
import 'package:news_wave/utils/colors.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: bgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: secondaryColor,
      foregroundColor: textColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: textColor),
      headlineMedium: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.bold, color: textColor),
      headlineSmall: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: textColor),
      titleLarge: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.w600, color: textColor),
      titleMedium: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w500, color: textColor),
      titleSmall: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, color: subTextColor),
      bodyLarge: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.normal, color: textColor),
      bodyMedium: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.normal, color: subTextColor),
      bodySmall: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.normal, color: subTextColor),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: accentColor,
      secondary: secondaryColor,
    ),
  );
}
