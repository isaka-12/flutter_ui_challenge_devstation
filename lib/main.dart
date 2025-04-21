import 'package:fikratech/core/theme/theme.dart';
import 'package:fikratech/features/profile/pages/languages.dart';
import 'package:fikratech/features/profile/pages/location_address.dart';
import 'package:fikratech/features/profile/pages/notifications.dart';
import 'package:fikratech/features/profile/pages/edit_profile.dart';
import 'package:fikratech/features/profile/pages/security.dart';

import 'package:fikratech/features/profile/pages/view_profiel.dart';

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
            '/': (context) => const ViewProfile(),
            '/editprofile': (context) => const EditProfile(),
            '/address': (context) => const AdressPage(),

            '/view-profile': (context) => const ViewProfile(),
            '/languages': (context) => const Languages(),

            '/notifications': (context) => const Notifications(),
            '/security': (context) => const Security(),
          },
        );
      },
    );
  }
}
