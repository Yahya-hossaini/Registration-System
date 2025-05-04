import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> deleteOldDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'registrations.db');
  if (await File(path).exists()) {
    await deleteDatabase(path);
    print('Old database deleted.');
  } else {
    print('No old database found.');
  }
}
