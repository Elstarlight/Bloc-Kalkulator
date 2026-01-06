import 'package:flutter/material.dart';

class KalkulatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const KalkulatorButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(70, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // curve dikit
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
