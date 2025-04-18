import 'package:fikratech/core/theme/theme.dart';
import 'package:fikratech/featurs/auth/pages/splash_screen.dart';
import 'package:fikratech/featurs/auth/pages/signup_page.dart';
import 'package:fikratech/featurs/profile/pages/profile.dart';
import 'package:fikratech/featurs/profile/pages/view_profiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: currentMode,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/signup': (context) => const SignupPage(),
            '/profile': (context) => const Profile(),
            '/view-profile': (context) => const ViewProfile(),
          },
        );
      },
    );
  }
}
