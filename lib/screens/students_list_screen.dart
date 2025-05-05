import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_system/screens/edit_screen.dart';
import 'package:registration_system/widgets/custom_appbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../data_provider.dart';

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
  String? _selectedValue = 'All';

  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<DataProvider>(context, listen: false)
        .fetchRegisteredStudents());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final students = Provider.of<DataProvider>(context).registration;

    //Filter logic
    List<Map<String, dynamic>> filteredStudents = _selectedValue == 'All'
        ? students
        : students.where((student) {
            final department =
                student['department']?.toString().toLowerCase() ?? '';
            if (_selectedValue == 'Only Software') {
              return department == 'software';
            } else if (_selectedValue == 'Only Network') {
              return department == 'network';
            } else if (_selectedValue == 'Only Database') {
              return department == 'database';
            }
            return true;
          }).toList();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Filter:', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              SizedBox(
                width: 228,
                height: 54,
                child: DropdownButtonFormField2<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text('Select a department',
                      style: TextStyle(fontSize: 16)),
                  value: _selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue;
                    });
                  },
                  items: _options
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item,
                                style: const TextStyle(fontSize: 16)),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: filteredStudents.isEmpty
                    ? const Center(child: Text('No students found'))
                    : ListView.builder(
                        itemCount: filteredStudents.length,
                        itemBuilder: (context, index) {
                          final student = filteredStudents[index];
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${student['name']} ${student['lastName']}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text('ID: ${student['studentId']}'),
                                  ],
                                ),
                                PopupMenuButton<String>(
                                  onSelected: (value) async {
                                    if (value == 'edit') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => EditStudentScreen(
                                              studentData: student),
                                        ),
                                      );
                                    } else if (value == 'delete') {
                                      await Provider.of<DataProvider>(context,
                                              listen: false)
                                          .deleteStudent(student['id']);
                                    }
                                  },
                                  itemBuilder: (BuildContext context) => [
                                    const PopupMenuItem(
                                      value: 'edit',
                                      child: Text('Edit'),
                                    ),
                                    const PopupMenuItem(
                                      value: 'delete',
                                      child: Text('Delete'),
                                    ),
                                  ],
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
    );
  }
}
