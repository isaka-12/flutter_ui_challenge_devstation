import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.prefilledText,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String prefilledText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(250, 250, 250, 1.0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          prefixIcon ?? const SizedBox(),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: TextEditingController(text: prefilledText),
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          const SizedBox(width: 8),
          suffixIcon ?? const SizedBox(),
        ],
      ),
    );
  }
}
