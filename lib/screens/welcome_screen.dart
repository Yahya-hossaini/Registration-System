import 'package:flutter/material.dart';
import 'package:registration_system/widgets/app_icon.dart';
import 'package:registration_system/widgets/custome_elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome-Screen';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0XFF89FDFF),
              Color(0XFF89FDFF),
              Color(0XFF89FDFF),
              Color(0XFF489A9B),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.15,
            horizontal: size.width * 0.06,
          ),
          child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    const AppIcon(
                      radius: 46,
                      fontSize: 56,
                    ),
                    SizedBox(height: size.height * 0.04),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.20,
                ),
                Column(
                  children: [
                    CustomElevatedButton(
                      title: 'Register new Student',
                      handler: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CustomElevatedButton(
                      title: 'View Students',
                      handler: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
