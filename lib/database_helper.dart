import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('registrations.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE registrations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        studentId TEXT NOT NULL,
        name TEXT NOT NULL,
        lastName TEXT NOT NULL,
        age INTEGER NOT NULL,
        department TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertRegistration(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('registrations', row);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<List<Map<String, dynamic>>> getAllRegistrations() async {
    final db = await instance.database;
    return await db.query('registrations');
  }

  Future<int> deleteStudent(int id) async {
    final db = await instance.database;
    return await db.delete(
      'registrations',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateStudent(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.update(
      'registrations',
      row,
      where: 'id = ?',
      whereArgs: [row['id']],
    );
  }

}
