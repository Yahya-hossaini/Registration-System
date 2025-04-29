import 'package:flutter/material.dart';
import 'package:registration_system/widgets/custom_appbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class StudentsListScreen extends StatefulWidget {
  static const routeName = '/students-list-Screen';

  const StudentsListScreen({super.key});

  @override
  State<StudentsListScreen> createState() => _StudentsListScreenState();
}

class _StudentsListScreenState extends State<StudentsListScreen> {
  final List<String> _options = [
    'All',
    'Only Software',
    'Only Network',
    'Only Database'
  ];
  String? _selectedValue;

  List<Map<String, dynamic>> students = [
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
    {
      'id': 'S3832',
      'name': 'Ali',
      'last name': 'Akbari',
      'age': 20,
      'department': 'Software',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar().buildPreferredSize(context, 'Students'),
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
          padding: EdgeInsets.only(
            left: size.width * 0.06,
            right: size.width * 0.06,
            top: size.height * 0.03,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Filter:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 228,
                      height: 54,
                      child: DropdownButtonFormField2<String>(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Select a department',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Select a department',
                          style: TextStyle(fontSize: 16),
                        ),
                        value: _selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedValue = newValue;
                          });
                        },
                        items: _options
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        margin: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        height: 64,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${students[index]['name']} ${students[index]['last name']}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text('ID: ${students[index]['id']}'),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert_outlined),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
