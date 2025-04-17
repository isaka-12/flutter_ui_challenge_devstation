import 'package:fikratech/main.dart';
import 'package:flutter/material.dart';
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Monitor'),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          isDarkMode ? 'Dark Mode' : 'Light Mode',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
