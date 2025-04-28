import 'package:flutter/material.dart';

class ClearNewFormElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback handler;

  const ClearNewFormElevatedButton({
    super.key,
    required this.title,
    required this.handler,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFFFCB844),
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: handler,
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}