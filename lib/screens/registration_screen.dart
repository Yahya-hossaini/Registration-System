import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_system/widgets/custom_appbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../database_helper.dart';
import '../widgets/ClearAndNewFormButtons.dart';
import '../widgets/CustomeTextField.dart';
import '../widgets/RegisterSaveButton.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/registration-Screen';

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //Input text Controllers
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  //Options for departments
  final List<String> _options = ['Software', 'Network', 'Database'];
  String? _selectedValue;

  //-------------------------------------------------------------------------------------
  //For registration
  Future<void> _saveRegistration() async {
    String id = idController.text.trim();
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    int? age = int.tryParse(ageController.text.trim());
    String? department = _selectedValue;

    if (id.isEmpty ||
        name.isEmpty ||
        lastName.isEmpty ||
        age == null ||
        department == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill out all fields correctly.")),
      );
      return;
    }

    final row = {
      'studentId': id,
      'name': name,
      'lastName': lastName,
      'age': age,
      'department': department,
    };

    await DatabaseHelper.instance.insertRegistration(row);

    final data = await DatabaseHelper.instance.getAllRegistrations();
    print("All Registrations:");
    for (var row in data) {
      print(row);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Registration saved!")),
    );
  }

  //-------------------------------------------------------------------------------------
  //Clear form function
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
      appBar: CustomAppBar().buildPreferredSize(context, 'Registration'),
      body: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
                vertical: size.height * 0.15,
              ),
              child: Center(
                child: Column(
                  children: [
                    Column(
                      children: [
                        CustomTextField(
                          controller: nameController,
                          title: 'Name',
                          hintText: 'e.g Farhad',
                          keyboardType: TextInputType.name,
                        ),
                        CustomTextField(
                          controller: lastNameController,
                          title: 'Last Name',
                          hintText: 'e.g Hossaini',
                          keyboardType: TextInputType.name,
                        ),
                        CustomTextField(
                          controller: ageController,
                          title: 'Age',
                          hintText: 'e.g 20,',
                          keyboardType: TextInputType.number,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Department:',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              child: DropdownButtonFormField2<String>(
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
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: ClearNewFormElevatedButton(
                            title: 'Clear form',
                            handler: _clearForm,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RegisterSaveButton(
                      title: 'Register',
                      handler: _saveRegistration,
                      icon: Icons.person_add_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
