import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/models/task.model.dart';
import 'package:todoapp/parameters/database-keys.parameters.dart';
import 'package:path/path.dart';

class TaskRepository {
  static final TaskRepository _instance = TaskRepository.internal();

  factory TaskRepository() => _instance;

  TaskRepository.internal();

  Database _database;

  Future<Database> get _getDatabase async {
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

  Future<List<TaskModel>> get() async {
    try {
      final Database db = await _getDatabase;
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);

      return List.generate(maps.length, (index) {
        return _mountedTask(maps, index);
      });
    } catch (ex) {
      print(ex);
      return new List<TaskModel>();
    }
  }

  Future<List<TaskModel>> search(String params) async {
    try {
      final Database db = await _getDatabase;
      final List<Map<String, dynamic>> findResults = await db.query(
        TABLE_NAME,
        where: '$NAME_COLUMN LIKE ?',
        whereArgs: ['%$params%'],
      );

      return List.generate(findResults.length, (index) {
        return _mountedTask(findResults, index);
      });
    } catch (ex) {
      print(ex);
      return new List<TaskModel>();
    }
  }

  Future<TaskModel> getById(int id) async {
    try {
      final Database db = await _getDatabase;
      final List<Map<String, dynamic>> findResult = await db.query(
        TABLE_NAME,
        where: 'id = ?',
        whereArgs: [id],
      );
      return _mountedTask(findResult, 0);
    } catch (ex) {
      print(ex);
      return TaskModel();
    }
  }

  Future create(TaskModel model) async {
    try {
      final Database db = await _getDatabase;

      await db.insert(
        TABLE_NAME,
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  TaskModel _mountedTask(List<Map<String, dynamic>> maps, int index) {
    return TaskModel(
      id: maps[index][ID_COLUMN],
      name: maps[index][NAME_COLUMN],
      description: maps[index][DESCRIPTION_COLUMN],
      imageUrl: maps[index][IMAGE_COLUMN],
      status: maps[index][STATUS_COLUMN],
    );
  }
}
