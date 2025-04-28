import 'package:flutter/material.dart';

import 'app_icon.dart';

class CustomAppBar{

  PreferredSize buildPreferredSize(BuildContext context, String title) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: const Color(0XFF89FDFF),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_rounded),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              const AppIcon(radius: 24, fontSize: 24),
            ],
          ),
        ),
      ),
    );
  }

}