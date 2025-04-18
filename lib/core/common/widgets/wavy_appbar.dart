import 'package:flutter/material.dart';

class WavyAppBar extends StatelessWidget {
  final double height;
  final Color color;

  const WavyAppBar({
    super.key,
    this.height = 180.0,
    this.color = const Color(0xFF6C63FF), // your primary color
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _WavyClipper(),
      child: Container(
        height: height,
        color: color,
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0),
            child: Align(alignment: Alignment.topLeft),
          ),
        ),
      ),
    );
  }
}

class _WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 50);

    final firstControlPoint = Offset(size.width * 0.75, size.height);
    final firstEndPoint = Offset(size.width * 0.5, size.height - 60);

    final secondControlPoint = Offset(size.width * 0.25, size.height - 120);
    final secondEndPoint = Offset(0, size.height - 20);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
