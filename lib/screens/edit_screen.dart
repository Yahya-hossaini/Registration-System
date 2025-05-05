import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_system/data_provider.dart';
import 'package:registration_system/widgets/custom_appbar.dart';
import 'package:registration_system/widgets/CustomeTextField.dart';
import 'package:registration_system/widgets/ClearAndNewFormButtons.dart';
import 'package:registration_system/widgets/RegisterSaveButton.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class EditStudentScreen extends StatefulWidget {
  final Map<String, dynamic> studentData;

  const EditStudentScreen({super.key, required this.studentData});

  @override
  State<EditStudentScreen> createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController lastNameController;
  late TextEditingController ageController;
  String? _selectedValue;

  //FocusNodes for text fields
  FocusNode nameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode ageFocus = FocusNode();
  FocusNode idFocus = FocusNode();

  @override
  void dispose() {
    // Dispose focus nodes
    nameFocus.dispose();
    lastNameFocus.dispose();
    ageFocus.dispose();
    idFocus.dispose();
    super.dispose();
  }

  final List<String> _options = ['Software', 'Network', 'Database'];

  @override
  void initState() {
    super.initState();
    idController = TextEditingController(text: widget.studentData['studentId']);
    nameController = TextEditingController(text: widget.studentData['name']);
    lastNameController = TextEditingController(text: widget.studentData['lastName']);
    ageController = TextEditingController(text: widget.studentData['age'].toString());
    _selectedValue = widget.studentData['department'];
  }

  Future<void> _saveChanges() async {
    final updatedData = {
      'id': widget.studentData['id'], // Needed for update
      'studentId': idController.text.trim(),
      'name': nameController.text.trim(),
      'lastName': lastNameController.text.trim(),
      'age': int.tryParse(ageController.text.trim()),
      'department': _selectedValue,
    };

    if (updatedData.values.any((element) => element == null || (element is String && element.isEmpty))) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields correctly.')),
      );
      return;
    }

    try {
      await Provider.of<DataProvider>(context, listen: false).updateStudent(updatedData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student updated successfully.')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update student: $e')),
      );
    }
  }

  void _clearForm() {
    idController.clear();
    nameController.clear();
    lastNameController.clear();
    ageController.clear();
    setState(() {
      _selectedValue = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar().buildPreferredSize(context, 'Edit Student'),
      body: LayoutBuilder(
        builder: (context, constraints){
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
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
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
                  vertical: size.height * 0.1,
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: nameController,
                      title: 'Name',
                      hintText: 'e.g Farhad',
                      keyboardType: TextInputType.name,
                      focusNode: nameFocus,
                      onSubmit: () => FocusScope.of(context).requestFocus(lastNameFocus),
                    ),
                    CustomTextField(
                      controller: lastNameController,
                      title: 'Last Name',
                      hintText: 'e.g Hossaini',
                      keyboardType: TextInputType.name,
                      focusNode: lastNameFocus,
                      onSubmit: () => FocusScope.of(context).requestFocus(ageFocus),
                    ),
                    CustomTextField(
                      controller: ageController,
                      title: 'Age',
                      hintText: 'e.g 20',
                      keyboardType: TextInputType.number,
                      focusNode: ageFocus,
                      onSubmit: () => FocusScope.of(context).requestFocus(idFocus),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Department:',
                          style: TextStyle(fontSize: 16),
                        ),
                        DropdownButtonFormField2<String>(
                          value: _selectedValue,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Select a department',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                          ),
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValue = newValue;
                            });
                          },
                          items: _options
                              .map(
                                (item) => DropdownMenuItem(
                              value: item,
                              child: Text(item, style: const TextStyle(fontSize: 16)),
                            ),
                          )
                              .toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: idController,
                            title: 'Student ID',
                            hintText: 'D4050',
                            keyboardType: TextInputType.text,
                            bottomSpacing: 0,
                            focusNode: idFocus,
                            onSubmit: () => idFocus.unfocus,
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: ClearNewFormElevatedButton(
                            title: 'Clear form',
                            handler: _clearForm,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    RegisterSaveButton(
                      title: 'Save Changes',
                      handler: _saveChanges,
                      icon: Icons.save_alt,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
