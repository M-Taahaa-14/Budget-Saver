import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'savers.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE expenses(id INTEGER PRIMARY KEY, category TEXT, amount REAL, description TEXT, date TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertExpense(Map<String, dynamic> expense) async {
    final db = await database;
    await db.insert('expenses', expense);
  }

  Future<List<Map<String, dynamic>>> getExpenses() async {
    final db = await database;
    return await db.query('expenses');
  }
}
