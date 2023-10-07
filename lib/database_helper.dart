import 'package:fluttertask/modals/question_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _database;

  Future<void> initializeDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'tasks.db');

    _database = await openDatabase(databasePath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT)',
      );
    });
  }

  void insert(Item task) async {
    await _database!.insert('tasks', task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Item>> getAllTasks() async {
    final List<Map<String, dynamic>> maps = await _database!.query('tasks');

    return List.generate(maps.length, (i) {
      return Item.fromJson(maps[i]);
    });
  }
}
// class Task {
//   int? id;
//   String? title;

//   Task({this.id, this.title});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'title': title,
//     };
//   }

//   factory Task.fromMap(Map<String, dynamic> map) {
//     return Task(
//       id: map['id'],
//       title: map['title'],
//     );
//   }
// }