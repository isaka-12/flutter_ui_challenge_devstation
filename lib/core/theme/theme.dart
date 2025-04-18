import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF6C63FF),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF6C63FF),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF6C63FF),
    onPrimary: Colors.white,
    secondary: const Color(0xFFE0E0E0),
    onSecondary: Colors.black,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
    error: const Color(0xFFB00020),
    onError: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black87),
    titleLarge: TextStyle(color: Colors.black),
  ),
  iconTheme: const IconThemeData(color: Colors.black87),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.tealAccent,
  scaffoldBackgroundColor: const Color(0xFF121212),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1F1F1F),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.tealAccent,
    onPrimary: Colors.black,
    secondary: const Color(0xFF2C2C2C),
    onSecondary: Colors.white,
    background: const Color(0xFF121212),
    onBackground: Colors.white,
    surface: const Color(0xFF1E1E1E),
    onSurface: Colors.white70,
    error: const Color(0xFFCF6679),
    onError: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(color: Colors.white),
  ),
  iconTheme: const IconThemeData(color: Colors.white70),
);
