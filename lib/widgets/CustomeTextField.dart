import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: const TextStyle(fontSize: 16),
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}