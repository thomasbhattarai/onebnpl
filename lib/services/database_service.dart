import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}/onebnpl.db';

      final db = sqlite3.open(path);
      _createTables(db);
      return db;
    } catch (e) {
      print('Database initialization error: $e');
      rethrow;
    }
  }

  void _createTables(Database db) {
    db.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        full_name TEXT NOT NULL,
        phone_number TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        created_at TEXT NOT NULL
      )
    ''');
  }

  // User operations
  Future<void> insertUser({
    required String fullName,
    required String phoneNumber,
    required String password,
  }) async {
    final db = await database;
    try {
      print('📝 Inserting user: $phoneNumber, $fullName');
      db.execute(
        'INSERT INTO users (full_name, phone_number, password, created_at) VALUES (?, ?, ?, ?)',
        [fullName, phoneNumber, password, DateTime.now().toIso8601String()],
      );
      print('✅ User inserted successfully');
    } on SqliteException catch (e) {
      print('❌ Database error: ${e.message}');
      if (e.message.contains('UNIQUE constraint failed')) {
        throw Exception('User with this phone number already exists');
      }
      rethrow;
    } catch (e) {
      print('❌ Insert error: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getUserByPhone(String phoneNumber) async {
    final db = await database;
    try {
      print('🔍 Searching for user: $phoneNumber');
      final result = db
          .prepare('SELECT * FROM users WHERE phone_number = ?')
          .select([phoneNumber]);

      print('📊 Query result count: ${result.length}');
      if (result.isEmpty) {
        print('❌ No user found');
        return null;
      }

      final row = result.first;
      print('✅ User found: ${row['full_name']}');

      return {
        'id': row['id'] as int,
        'full_name': row['full_name'] as String,
        'phone_number': row['phone_number'] as String,
        'password': row['password'] as String,
        'created_at': row['created_at'] as String,
      };
    } catch (e) {
      print('❌ Query error: $e');
      return null;
    }
  }

  Future<bool> userExists(String phoneNumber) async {
    final user = await getUserByPhone(phoneNumber);
    return user != null;
  }

  // Debug method to print all users
  Future<void> printAllUsers() async {
    final db = await database;
    try {
      final result = db.select('SELECT * FROM users');
      print('📋 Total users in database: ${result.length}');
      for (final row in result) {
        print('   - ${row['phone_number']}: ${row['full_name']}');
      }
    } catch (e) {
      print('❌ Error printing users: $e');
    }
  }

  Future<void> close() async {
    final db = await database;
    db.dispose();
  }
}
