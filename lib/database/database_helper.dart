import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // Singleton pattern to ensure only one instance of DatabaseHelper exists
  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the SQLite database
  Future<Database> _initDatabase() async {
    // Get the path to store the database file
    String path = join(await getDatabasesPath(), 'login_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create the table for login details when the database is first created
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE login(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  // Insert login details into the database
  Future<int> insertLogin(Map<String, dynamic> login) async {
    final db = await database;
    return await db.insert('login', login);
  }

  // Retrieve login details by username
  Future<Map<String, dynamic>?> getLogin(String username) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'login',
      where: 'username = ?',
      whereArgs: [username],
    );
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  // Update password for an existing user
  Future<int> updatePassword(String username, String newPassword) async {
    final db = await database;
    return await db.update(
      'login',
      {'password': newPassword},
      where: 'username = ?',
      whereArgs: [username],
    );
  }

  // Delete a user from the database
  Future<int> deleteUser(String username) async {
    final db = await database;
    return await db.delete(
      'login',
      where: 'username = ?',
      whereArgs: [username],
    );
  }

  // Fetch all login details from the database
  Future<List<Map<String, dynamic>>> getAllLogins() async {
    final db = await database;
    return await db.query('login');
  }
}
