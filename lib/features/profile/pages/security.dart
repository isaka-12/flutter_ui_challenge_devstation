import 'package:flutter/material.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  // List of notification settings
  final List<Map<String, dynamic>> _notificationSettings = [
    {'title': 'Remember Me', 'isEnabled': true},
    {'title': 'Face ID', 'isEnabled': true},
    {'title': 'Biometric ID', 'isEnabled': true},
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
          'Security',
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color.fromRGBO(
                        238,
                        238,
                        238,
                        1.0,
                      ),
                      thumbColor: WidgetStateProperty.all(Colors.white),
                      trackOutlineColor: const WidgetStatePropertyAll<Color>(
                        Color.fromARGB(0, 214, 214, 214),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Google Authenticator',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              text: "Change PIN",
              onTap: () {
                // Handle Change PIN action
              },
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              text: "Change Password",
              onTap: () {
                // Handle Change Password action
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(
    BuildContext context, {
    required String text,
    required VoidCallback onTap,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isPressed = false;

        return GestureDetector(
          onTapDown: (_) => setState(() => isPressed = true),
          onTapUp: (_) {
            setState(() => isPressed = false);
            onTap();
          },
          onTapCancel: () => setState(() => isPressed = false),
          child: AnimatedScale(
            scale: isPressed ? 0.95 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: Material(
              color: const Color.fromRGBO(254, 239, 237, 1),
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                splashColor: Theme.of(
                  context,
                ).colorScheme.secondary.withOpacity(0.2),
                highlightColor: Theme.of(
                  context,
                ).colorScheme.secondary.withOpacity(0.1),
                onTap: () {}, // Handled by GestureDetector
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
