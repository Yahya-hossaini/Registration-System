import 'package:flutter/material.dart';
import 'package:registration_system/data_provider.dart';
import 'package:registration_system/screens/registration_screen.dart';
import 'package:registration_system/screens/students_list_screen.dart';
import 'package:registration_system/screens/welcome_screen.dart';
import 'package:registration_system/database_utils.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await deleteOldDatabase();

  runApp(
    ChangeNotifierProvider(
      create: (_) => DataProvider()..fetchRegisteredStudents(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/welcome-Screen',
      routes: {
        WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
        RegistrationScreen.routeName: (ctx) => const RegistrationScreen(),
        StudentsListScreen.routeName: (ctx) => const StudentsListScreen(),
      },
    );
  }
}
