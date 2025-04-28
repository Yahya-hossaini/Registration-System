import 'package:flutter/material.dart';
import 'package:registration_system/widgets/custom_appbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final List<String> _options = ['Software', 'Network', 'Database'];
  String? _selectedValue;

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
                    RegisterSaveButton(
                      title: 'Register',
                      handler: () {},
                      icon: Icons.person_add_outlined,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ClearNewFormElevatedButton(
                            title: 'New form',
                            handler: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: ClearNewFormElevatedButton(
                            title: 'Clear form',
                            handler: () {},
                          ),
                        ),
                      ],
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


