import 'package:flutter/material.dart';
import 'package:weather_app/values.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFFE0E5EC),
        surfaceTintColor: Colors.black.withOpacity(0.1),
        shadowColor: Colors.white.withOpacity(0.7),
        elevation: 10,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 3, vertical: kDefaultPadding),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
