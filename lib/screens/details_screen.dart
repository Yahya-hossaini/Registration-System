import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/Details-Screen';

  final Map<String, dynamic> studentData;

  const DetailsScreen({super.key, required this.studentData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().buildPreferredSize(context, 'Details'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${studentData['name']}'),
            Text('Last Name: ${studentData['lastName']}'),
            Text('ID: ${studentData['studentId']}'),
            Text('Department: ${studentData['department']}'),
            Text('Age: ${studentData['age']}'),
          ],
        ),
      ),
    );
  }
}

