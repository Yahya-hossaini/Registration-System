import 'package:flutter/foundation.dart';
import 'database_helper.dart';

class DataProvider with ChangeNotifier{
  List<Map<String, dynamic>> _registration = [];

  List<Map<String, dynamic>> get registration => _registration;

  Future<void> fetchRegisteredStudents() async{
    final data = await DatabaseHelper.instance.getAllRegistrations();
    _registration = data;
    notifyListeners();
  }

  Future<void> addNewStudent(Map<String, dynamic> registration) async {
    await DatabaseHelper.instance.insertRegistration(registration);
    await fetchRegisteredStudents();
  }

  Future<void> closeDB() async {
    await DatabaseHelper.instance.close();
  }
}