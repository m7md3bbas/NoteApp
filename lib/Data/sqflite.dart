import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqflite {
  Database? _database;
  static Sqflite? _sqflite;

  Sqflite._privateConstructor();

  static Sqflite getInstance() {
    _sqflite ??= Sqflite._privateConstructor();
    return _sqflite!;
  }

  Future<Database> getDatabase() async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "note.db");
    _database = await openDatabase(
      path,
      version: 3,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return _database!;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME
      )
    ''');
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 3) {
      // Add updated_at column
      await db.execute("ALTER TABLE notes ADD COLUMN updated_at DATETIME");
    }
  }

  String formatDateTime(DateTime dateTime) {
    return dateTime.toIso8601String().split('T').join(' ').substring(0, 19);
  }

  Future<List<Map>> readdata() async {
    try {
      await getDatabase();
      String sql = "SELECT * FROM notes";
      return await _database!.rawQuery(sql);
    } catch (e) {
      print("Error reading data: $e");
      return [];
    }
  }

  Future<int> insertdata(
      {required String title, required String content}) async {
    try {
      await getDatabase();
      String sql =
          "INSERT INTO notes (title, content, created_at) VALUES (?, ?, ?)";
      return await _database!
          .rawInsert(sql, [title, content, formatDateTime(DateTime.now())]);
    } catch (e) {
      print("Error inserting data: $e");
      return -1;
    }
  }

  Future<int> updatedata(
      {required int id, required String title, required String content}) async {
    try {
      await getDatabase();
      String sql =
          "UPDATE notes SET title = ?, content = ?, created_at = ? WHERE id = ?";
      return await _database!
          .rawUpdate(sql, [title, content, formatDateTime(DateTime.now()), id]);
    } catch (e) {
      print("Error updating data: $e");
      return -1;
    }
  }

  Future<int> deletedata(int id) async {
    try {
      await getDatabase();
      String sql = "DELETE FROM notes WHERE id = ?";
      return await _database!.rawDelete(sql, [id]);
    } catch (e) {
      print("Error deleting data: $e");
      return -1;
    }
  }

  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
