import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:todoapp/parameters/database-keys.parameters.dart';

class DatabaseProvider {
  static final _instance = DatabaseProvider._internal();

  factory DatabaseProvider() => _instance;

  DatabaseProvider._internal();

  Database _database;

  Future<Database> getDatabase() async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDb();
    return _database;
  }

  Future<Database> _initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, DATABASE_NAME);

    return await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(CREATE_TABLE_TASKS_TABLE);
    });
  }
}
