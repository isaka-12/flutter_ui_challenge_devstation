import 'package:fikratech/core/theme/theme.dart';
import 'package:fikratech/featurs/auth/pages/splash_screen.dart';
import 'package:fikratech/featurs/auth/pages/signin_page.dart';
import 'package:fikratech/featurs/auth/pages/signup_page.dart';
import 'package:fikratech/featurs/profile/pages/downloads.dart';
import 'package:fikratech/featurs/profile/pages/invite_friends.dart';
import 'package:fikratech/featurs/profile/pages/languages.dart';
import 'package:fikratech/featurs/profile/pages/notifications.dart';
import 'package:fikratech/featurs/profile/pages/profile.dart';
import 'package:fikratech/featurs/profile/pages/security.dart';
import 'package:fikratech/featurs/profile/pages/settings.dart';
import 'package:fikratech/featurs/profile/pages/view_profiel.dart';
import 'package:fikratech/featurs/profile/pages/favourites.dart';
import 'package:fikratech/featurs/userpanel/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fikratech/featurs/profile/pages/locations.dart';

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
            '/home': (context) => const HomePage(),
            '/signup': (context) => const SignupPage(),
            '/login': (context) => const SigninPage(),
            '/profile': (context) => const Profile(),
            '/view-profile': (context) => const ViewProfile(),
            '/languages': (context) => const Languages(),
            '/downloads': (context) => const Downloads(),
            '/favourites': (context) => const Favourites(),
            '/invite-friends': (context) => const InviteFriends(),
            '/notifications': (context) => const Notifications(),
            '/security': (context) => const Security(),
            '/settings': (context) => const Settings(),
            '/location': (context) => const Locations(),
          },
        );
      },
    );
  }
}
