import 'package:sqflite/sqflite.dart';
import 'package:todoapp/models/task.model.dart';
import 'package:todoapp/parameters/database-keys.parameters.dart';
import 'package:todoapp/repositories/database-provider.repository.dart';
import 'package:todoapp/shared/enums/status-type.enum.dart';

class TaskRepository {
   DatabaseProvider _databaseProvider;

   TaskRepository(this._databaseProvider);

  Future<List<TaskModel>> get() async {
    try {
      final Database db = await _databaseProvider.getDatabase();
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
      final Database db = await _databaseProvider.getDatabase();
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
      final Database db = await _databaseProvider.getDatabase();
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
      final Database db = await _databaseProvider.getDatabase();

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
    var status = maps[index][STATUS_COLUMN];
    return TaskModel(
      id: maps[index][ID_COLUMN],
      name: maps[index][NAME_COLUMN],
      description: maps[index][DESCRIPTION_COLUMN],
      imageUrl: maps[index][IMAGE_COLUMN],
      status: status != null ? StatusType.values[int.parse(status)]  : StatusType.Open,
    );
  }
}
