import 'package:fikratech/featurs/profile/pages/view_profiel.dart';
import 'package:flutter/material.dart';

class ThirdPartyButton extends StatelessWidget {
  const ThirdPartyButton({
    super.key,
    required this.fieldname,
    required this.imagePath,
  });
  final String fieldname;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ViewProfile()),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 24),
            const SizedBox(width: 8),
            Text(fieldname, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
