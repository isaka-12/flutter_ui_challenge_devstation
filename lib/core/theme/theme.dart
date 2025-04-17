import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF6C63FF),
  colorScheme: const ColorScheme.light(
    primary:  Color(0xFF6C63FF),// Primary action color
    secondary: Color(0xFF2DD4BF),     // Accent or highlight
    onPrimary: Colors.white,   // Text color on primary
    
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  colorScheme: const ColorScheme.dark(
    primary: Colors.tealAccent,      // Primary action color
    secondary: Colors.deepOrange,    // Accent or highlight
    onPrimary: Colors.white,         // Text color on primary
    
  ),
  scaffoldBackgroundColor: Color(0xFF121212),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.grey,
    foregroundColor: Colors.white,
  ),
);
