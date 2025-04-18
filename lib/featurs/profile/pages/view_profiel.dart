import 'package:fikratech/featurs/profile/widgets/nav.dart';
import 'package:flutter/material.dart';
import 'package:fikratech/core/common/widgets/wavy_appbar.dart';
import 'package:fikratech/main.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  bool _isDarkMode = themeNotifier.value == ThemeMode.dark;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isDarkMode = themeNotifier.value == ThemeMode.dark;
      });
    });
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      themeNotifier.value = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

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
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: const Color(0xFF6C63FF),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/avatar.jpg',
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maria Alinda',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color:
                                    _isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'maria@gmail.com',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    _isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6C63FF),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: MainContent(
                              isDarkMode: _isDarkMode,
                              onDarkModeToggle: _toggleTheme,
                            ),
                          ),
                        ],
                      ),
                    ),
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
              color: Color(0xFF6C63FF),
              padding: const EdgeInsets.fromLTRB(16, 70, 16, 16),
              child: Nav(
                isStart: false,
                title: 'My Profile',
                startIcon: Icons.home,
                icon: Icons.settings_outlined,
                onStartIconTap: () {
                  Navigator.pushNamed(context, '/home');
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

class MainContent extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onDarkModeToggle;

  const MainContent({
    super.key,
    required this.isDarkMode,
    required this.onDarkModeToggle,
  });

  Widget _buildProfileMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Function() onTap,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 28,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Icon(Icons.chevron_right, size: 28),
          ],
        ),
      ),
    );
  }

  Widget _buildDarkModeToggle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            isDarkMode ? Icons.dark_mode : Icons.dark_mode_outlined,
            size: 28,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Dark mode',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Switch(
            value: isDarkMode,
            onChanged: (value) => onDarkModeToggle(),
            activeColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileMenuItem(
          context: context,
          icon: Icons.favorite_outline,
          title: 'Favorites',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Favorites coming soon')),
            );
          },
        ),

        _buildProfileMenuItem(
          context: context,
          icon: Icons.download_outlined,
          title: 'Downloads',
          onTap: () {
            Navigator.pushNamed(context, '/downloads');
          },
        ),

        const SizedBox(height: 8, child: Divider(color: Color(0xFF757575))),

        _buildProfileMenuItem(
          context: context,
          icon: Icons.language_outlined,
          title: 'Languages',
          onTap: () {
            Navigator.pushNamed(context, '/languages');
          },
        ),

        _buildProfileMenuItem(
          context: context,
          icon: Icons.location_on_outlined,
          title: 'Location',
          onTap: () {
            Navigator.pushNamed(context, '/location');
          },
        ),

        _buildDarkModeToggle(context),

        _buildProfileMenuItem(
          context: context,
          icon: Icons.notifications_outlined,
          title: 'Notification',
          onTap: () {
            Navigator.pushNamed(context, '/notifications');
          },
        ),

        _buildProfileMenuItem(
          context: context,
          icon: Icons.subscriptions_outlined,
          title: 'Subscription',
          onTap: () {
            Navigator.pushNamed(context, '/subscription');
          },
        ),

        _buildProfileMenuItem(
          context: context,
          icon: Icons.people_outline,
          title: 'Invite Friends',
          onTap: () {
            Navigator.pushNamed(context, '/invite-friends');
          },
        ),

        const SizedBox(height: 8, child: Divider(color: Color(0xFF757575))),

        _buildProfileMenuItem(
          context: context,
          icon: Icons.delete_outlined,
          title: 'Clear Cache',
          onTap: () {
            Navigator.pushNamed(context, '/clear-cache');
          },
        ),

        _buildProfileMenuItem(
          context: context,
          icon: Icons.history_outlined,
          title: 'Clear History',
          onTap: () {
            Navigator.pushNamed(context, '/clear-history');
          },
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Log Out'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child: const Text(
                          'Log Out',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            borderRadius: BorderRadius.circular(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  size: 28,
                  color: Colors.red,
                  semanticLabel: 'Log out',
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                const Icon(Icons.chevron_right, size: 28, color: Colors.red),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
