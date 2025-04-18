import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CustomActionButton({
    super.key,
    required this.formKey,
    required this.buttonname,
    required this.onPressed,
  });
  final String buttonname;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Text(
              buttonname,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, // You can use colorScheme.onPrimary too
              ),
            ),

            const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }
}
