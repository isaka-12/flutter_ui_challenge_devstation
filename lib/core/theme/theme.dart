import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF6C63FF),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFFFFFFFF), // Primary action color
    secondary: Color(0xFFF85F47), // Accent or highlight
    onPrimary: Colors.grey, // Text color on primary
    error: Color(0xFFB00020), // Error color
    onError: Colors.white, // Text color on error
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black12,
  colorScheme: const ColorScheme.dark(
    primary: Colors.black12, // Primary action color
    secondary: Colors.deepOrange, // Accent or highlight
    onPrimary: Colors.white, // Text color on primary
    error: Color(0xFFB00020), // Error color
    onError: Colors.white, // Text color on error
  ),
);
