import 'package:flutter/material.dart';

class WavyAppBar extends StatelessWidget {
  final double height;
  final Color color;
  final String? title;
  final String? waveTitle; // New title for the wave space
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;

  const WavyAppBar({
    super.key,
    this.height = 180, // Slightly increased height
    this.color = const Color(0xFF6C63FF),
    this.title,
    this.waveTitle, // New parameter for wave title
    this.centerTitle = true,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Original wavy background
        ClipPath(
          clipper: _OriginalWavyClipper(),
          child: Container(
            height: height,
            color: color,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        leading ?? const SizedBox(width: 24),

                        if (title != null)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Text(
                                title!,
                                textAlign:
                                    centerTitle
                                        ? TextAlign.center
                                        : TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        else
                          const Spacer(),

                        if (actions != null)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children:
                                actions!
                                    .map(
                                      (action) => Padding(
                                        padding: const EdgeInsets.only(
                                          left: 0.0,
                                        ),
                                        child: action,
                                      ),
                                    )
                                    .toList(),
                          )
                        else
                          const SizedBox(width: 24),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Wave title positioned in the white space
        if (waveTitle != null)
          Positioned(
            bottom: 20, // Positioned in the wave's curve
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(
                left: centerTitle ? 0 : 24.0, // Adjust for alignment
                right: 24.0,
              ),
              child: Text(
                waveTitle!,
                textAlign: centerTitle ? TextAlign.center : TextAlign.left,
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _OriginalWavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 100);

    // Original wave points
    final firstControlPoint = Offset(size.width, size.height);
    final firstEndPoint = Offset(size.width * 0.6, size.height - 60);

    final secondControlPoint = Offset(size.width * 0.25, size.height - 120);
    final secondEndPoint = Offset(0, size.height);

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
