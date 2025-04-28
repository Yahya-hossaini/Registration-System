import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double radius;
  final double fontSize;

  const AppIcon({
    super.key,
    required this.radius,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0XFF9C27B0),
      radius: radius,
      child: Text(
        'R',
        style: TextStyle(
          fontSize: fontSize,
          color: const Color(0XFFE1BEE7),
        ),
      ),
    );
  }
}