import 'package:flutter/material.dart';
import 'package:fikratech/core/common/widgets/wavy_appbar.dart';
import 'package:fikratech/featurs/profile/widgets/nav.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

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
                    children: [const SizedBox(width: 24)],
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
                title: 'Downloads',
                startIcon: Icons.chevron_left,
                icon: Icons.notifications_outlined,
                onStartIconTap: () {
                  Navigator.pop(context);
                },
                onIconTap: () {
                  Navigator.pushNamed(context, '/notifications');
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
