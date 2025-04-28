import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback handler;

  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.handler,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: handler,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFF848484),
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}