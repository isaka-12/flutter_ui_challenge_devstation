import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  // List of notification settings
  final List<Map<String, dynamic>> _notificationSettings = [
    {'title': 'General Notifications', 'isEnabled': true},
    {'title': 'Sound', 'isEnabled': true},
    {'title': 'Vibration', 'isEnabled': false},
    {'title': 'Special Offers', 'isEnabled': true},
    {'title': 'Promo and Discounts', 'isEnabled': false},
    {'title': 'Payments', 'isEnabled': true},
    {'title': 'Cashback', 'isEnabled': true},
    {'title': 'App Updates', 'isEnabled': true},
    {'title': 'New Service Available', 'isEnabled': false},
    {'title': 'New Tips Available', 'isEnabled': false},
  ];

  // Function to toggle switch state
  void _toggleNotification(int index, bool value) {
    setState(() {
      _notificationSettings[index]['isEnabled'] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _notificationSettings.length,
              itemBuilder: (context, index) {
                final setting = _notificationSettings[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  title: Text(
                    setting['title'],
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  trailing: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: setting['isEnabled'],
                      onChanged: (value) => _toggleNotification(index, value),
                      activeColor: Theme.of(context).colorScheme.secondary,
                      activeTrackColor: Theme.of(context).colorScheme.secondary,
                      inactiveThumbColor: Colors.white, // White dot when off
                      inactiveTrackColor: const Color.fromRGBO(
                        238,
                        238,
                        238,
                        1.0,
                      ), // Grey when off
                      thumbColor: WidgetStateProperty.all(
                        Colors.white,
                      ), // White dot
                      trackOutlineColor: const WidgetStatePropertyAll<Color>(
                        Color.fromARGB(0, 214, 214, 214),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
