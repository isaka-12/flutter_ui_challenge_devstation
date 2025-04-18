import 'package:flutter/material.dart';
import 'package:fikratech/core/common/widgets/wavy_appbar.dart';
import 'package:fikratech/featurs/profile/widgets/nav.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
                    children: [
                      Text(
                        'Notifications',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16),
                      MainContent(),
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
                title: 'Notifications',
                startIcon: Icons.chevron_left,
                onIconTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                icon: Icons.home,
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

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        NotificationToggleTile(title: 'General Notifications'),
        NotificationToggleTile(title: 'Sound'),
        NotificationToggleTile(title: 'Vibrate'),
        NotificationToggleTile(title: 'Special Offers'),
        NotificationToggleTile(title: 'Promo and discounts'),
        NotificationToggleTile(title: 'App updates'),
        NotificationToggleTile(title: 'New services'),
        NotificationToggleTile(title: 'New tips'),
      ],
    );
  }
}

class NotificationToggleTile extends StatefulWidget {
  const NotificationToggleTile({super.key, required this.title});
  final String title;

  @override
  State<NotificationToggleTile> createState() => _NotificationToggleTileState();
}

class _NotificationToggleTileState extends State<NotificationToggleTile> {
  bool isToggled = false;

  void toggle() {
    setState(() {
      isToggled = !isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggle,
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          Icon(
            isToggled ? Icons.toggle_on : Icons.toggle_off,
            size: 58,
            color: isToggled ? Color(0xFF6C63FF) : Colors.grey,
          ),
        ],
      ),
    );
  }
}
