import 'package:fikratech/core/common/widgets/wavy_appbar.dart';
import 'package:fikratech/featurs/profile/widgets/nav.dart';
import 'package:fikratech/main.dart';
import 'package:flutter/material.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const WavyAppBar(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Security',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16),
                      SecurityTile(
                        icon: Icons.lock_outline,
                        title: 'Password',
                        subtitle: 'Last updated 2 weeks ago',
                      ),
                      SecurityTile(
                        icon: Icons.security_outlined,
                        title: 'Two-Factor Authentication',
                        subtitle: 'Enabled',
                      ),
                      SecurityTile(
                        icon: Icons.devices_other,
                        title: 'Manage Services',
                        subtitle: 'View and manage your devices',
                      ),
                      SecurityTile(
                        icon: Icons.face,
                        title: 'Require Face ID',
                        isFaceIdToggle: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFF6C63FF),
              padding: const EdgeInsets.fromLTRB(16, 70, 16, 16),
              child: Nav(
                isStart: false,
                title: 'Security',
                startIcon: Icons.chevron_left,
                icon: Icons.security_outlined,
                onStartIconTap: () {
                  Navigator.pop(context);
                },
                isLast: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecurityTile extends StatefulWidget {
  const SecurityTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.isThemeToggle = false,
    this.isFaceIdToggle = false,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final bool isThemeToggle;
  final bool isFaceIdToggle;

  @override
  State<SecurityTile> createState() => _SecurityTileState();
}

class _SecurityTileState extends State<SecurityTile> {
  bool isFaceIdEnabled = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = themeNotifier.value == ThemeMode.dark;

    return InkWell(
      onTap: () {
        if (widget.isThemeToggle) {
          setState(() {
            themeNotifier.value = isDarkMode ? ThemeMode.light : ThemeMode.dark;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(widget.icon, color: Colors.black),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (widget.subtitle != null)
                    Text(
                      widget.subtitle!,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                ],
              ),
            ),
            if (widget.isThemeToggle)
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    themeNotifier.value =
                        value ? ThemeMode.dark : ThemeMode.light;
                  });
                },
              )
            else if (widget.isFaceIdToggle)
              Switch(
                value: isFaceIdEnabled,
                onChanged: (value) {
                  setState(() {
                    isFaceIdEnabled = value;
                  });
                },
              )
            else
              const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
