import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqflite {
  Database? _database;
  static Sqflite? _sqflite;

  Sqflite._privateConstractor();

  static Sqflite getInstance() {
    _sqflite ??= Sqflite._privateConstractor();
    return _sqflite!;
  }

  Future<Database> getDatabase() async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, "note.db");
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return _database!;
  }

  void _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
CREATE TABLE notes (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  content TEXT NOT NULL
)
''');
  }

//readdata'
  Future<List<Map>> readdata() async {
    await getDatabase();
    String sql = "SELECT * FROM notes";
    return await _database!.rawQuery(sql);
  }

//insertdata
  Future<int> insertdata(String title, String content) async {
    await getDatabase();
    String sql = "INSERT INTO notes (title, content) VALUES (?, ?)";
    return await _database!.rawInsert(sql, [title, content]);
  }

//updatedata
  Future<int> updatedata(int id, String title, String content) async {
    await getDatabase();
    String sql = "UPDATE notes SET title = ?, content = ? WHERE id = ?";
    return await _database!.rawUpdate(sql, [title, content, id]);
  }

//deletedata
  Future<int> deletedata(int id) async {
    await getDatabase();
    String sql = "DELETE FROM notes WHERE id = ?";
    return await _database!.rawDelete(sql, [id]);
  }
}
