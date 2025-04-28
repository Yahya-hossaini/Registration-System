import 'package:flutter/material.dart';

class RegisterSaveButton extends StatelessWidget {
  final String title;
  final VoidCallback handler;
  final IconData icon;

  const RegisterSaveButton({
    super.key,
    required this.title,
    required this.handler,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFF54F34F),
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: handler,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          const SizedBox(
            width: 12,
          ),
          Icon(
            icon,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}