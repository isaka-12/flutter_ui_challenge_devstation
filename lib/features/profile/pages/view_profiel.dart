import 'package:flutter/material.dart';
import 'package:fikratech/main.dart';
import 'package:iconly/iconly.dart';

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
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Image.asset("assets/images/mainlogo.png"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/editprofile');
            },
            icon: Icon(IconlyLight.more_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 12.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 42,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/avatar.png',
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
                          'Andrew Ainsley',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            color: _isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '+1 111 467 378 399',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            color:
                                _isDarkMode ? Colors.white : Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/editprofile');
                    },
                    icon: Icon(
                      IconlyBold.edit,
                      size: 24,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w500,
          ),
          type: BottomNavigationBarType.fixed,
          currentIndex: 4, // Profile is selected
          onTap: (index) {
            // Prevent navigating to the same page
            if (index == 4) return; // Already on Profile page
            switch (index) {
              case 0:
  //snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Home coming soon')),
                );
                break;
              case 1:
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Orders coming soon')),
                );
                break;
              case 2:
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Wishlist coming soon')),
                );
                break;
              case 3:
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('E-Wallet coming soon')),
                );
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.home, size: 24),
              activeIcon: Icon(IconlyBold.home, size: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.document, size: 24),
              activeIcon: Icon(IconlyBold.document, size: 24),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.heart, size: 24),
              activeIcon: Icon(IconlyBold.heart, size: 24),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.wallet, size: 24),
              activeIcon: Icon(IconlyBold.wallet, size: 24),
              label: 'E-Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile, size: 24),
              activeIcon: Icon(IconlyBold.profile, size: 24),
              label: 'Profile',
            ),
          ],
        ),
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
    required Widget icon,
    required String title,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 28, height: 28, child: icon),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Urbanist',
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
            const Icon(IconlyLight.arrow_right_2, size: 28),
          ],
        ),
      ),
    );
  }

  //language
  Widget _buildLanguageItem(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the language selection screen
        Navigator.pushNamed(context, '/languages');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(IconlyLight.more_square, size: 28),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Language',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  'English (US)',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const Icon(IconlyLight.arrow_right_2, size: 28),
              ],
            ),
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
          Icon(IconlyLight.show, size: 28),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Dark mode',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Switch(
            value: isDarkMode,
            onChanged: (value) => onDarkModeToggle(),
            activeColor: Theme.of(context).colorScheme.secondary,
            activeTrackColor: Theme.of(
              context,
            ).colorScheme.secondary.withOpacity(0.5),
            inactiveThumbColor: const Color.fromARGB(255, 255, 255, 255),
            inactiveTrackColor: const Color.fromARGB(
              255,
              187,
              186,
              186,
            ).withOpacity(0.5),
            trackOutlineColor: const WidgetStatePropertyAll<Color>(
              Color.fromARGB(0, 214, 214, 214),
            ),
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
        const SizedBox(
          height: 8,
          child: Divider(
            color: Color.fromARGB(255, 214, 214, 214),
            thickness: 2,
          ),
        ),
        _buildProfileMenuItem(
          context: context,
          icon: Icon(IconlyLight.calendar, size: 28),
          title: 'My Favorite Restaurants',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Favorites coming soon')),
            );
          },
        ),

        _buildProfileMenuItem(
          context: context,
          icon: Icon(IconlyLight.discount, size: 28),
          title: 'Special Offers & Promos',
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Offers coming soon')));
          },
        ),
        _buildProfileMenuItem(
          context: context,
          icon: Icon(IconlyLight.wallet, size: 28),
          title: 'Payment Methods',
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Coming soon')));
          },
        ),
        const SizedBox(
          height: 8,
          child: Divider(
            color: Color.fromARGB(255, 214, 214, 214),
            thickness: 2,
          ),
        ),
        _buildProfileMenuItem(
          context: context,
          icon: Icon(IconlyLight.profile, size: 28),
          title: 'Profile',
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Coming soon')));
          },
        ),
        _buildProfileMenuItem(
          context: context,
          icon: Icon(IconlyLight.location, size: 28),
          title: 'Locations',
          onTap: () {
            Navigator.pushNamed(context, '/address');
          },
        ),
        _buildProfileMenuItem(
          context: context,
          icon: Icon(IconlyLight.notification, size: 28),
          title: 'Notifications',
          onTap: () {
            Navigator.pushNamed(context, '/notifications');
          },
        ),
        _buildProfileMenuItem(
          context: context,
          icon: Icon(IconlyLight.shield_done, size: 28),
          title: 'Security',
          onTap: () {
            Navigator.pushNamed(context, '/security');
          },
        ),
        _buildLanguageItem(context),

        _buildDarkModeToggle(context),

        _buildProfileMenuItem(
          context: context,
          icon: Icon(IconlyLight.info_square, size: 28),
          title: 'Help Center',
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Coming soon')));
          },
        ),
        _buildProfileMenuItem(
          context: context,
          icon: Icon(IconlyLight.user_1, size: 28),
          title: 'Invite Friends',
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Coming soon')));
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
                          Navigator.of(context).pushReplacementNamed('/');
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
                  IconlyLight.logout,
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
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
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
