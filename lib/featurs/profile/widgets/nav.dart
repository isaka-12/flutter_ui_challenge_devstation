import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData startIcon;
  final VoidCallback onStartIconTap;
  final bool isLast;
  final bool isStart;

  const Nav({
    super.key,
    required this.title,
    required this.startIcon,
    required this.icon,
    required this.onStartIconTap,
    required this.isLast,
    required this.isStart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!isStart)
          IconButton(
            onPressed: onStartIconTap,
            icon: Icon(startIcon, size: 24, color: Colors.white),
          ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        if (!isLast)
          IconButton(
            onPressed: () {},
            icon: Icon(icon, size: 24, color: Colors.white),
          ),
      ],
    );
  }
}
