import 'package:beer_collection/entities/workout.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class WorkOutDbProvider {
  static Database? database;
  static const String tableName = 'work_out';

  static Future<void> _createTable(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, work_out_type INTEGER, registry_date REAL, calorie REAL, load REAL, frequency INTEGER, time INTEGER, distance REAL);');
  }

  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'workOut.db');
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  static Future<Database?> setDb() async {
    if (database == null) {
      database = await initDb();
      return database;
    } else {
      return database;
    }
  }

  static Future<void> insertUserData(RequestWorkOut workOut) async {
    await database!.insert(
      tableName,
      {
        'work_out_type': workOut.workOutType,
        'registry_date': workOut.registryDate,
        'calorie': workOut.calorie,
        'load': workOut.load,
        'frequency': workOut.frequency,
        'time': workOut.time,
        'distance': workOut.distance,
      },
      conflictAlgorithm: ConflictAlgorithm.rollback,
    );
  }

  static Future<List<WorkOutView>> getWorkOutList() async {
    final List<Map<String, dynamic>> workOutMap =
        await database!.query(tableName);

    if (workOutMap.isEmpty) {
      return [];
    } else {
      List<WorkOutView> workOutList = List.generate(
          workOutMap.length,
          (index) => WorkOutView(
                workOutMap[index]['id'],
                workOutMap[index]['work_out_type'],
                workOutMap[index]['registry_date'],
                workOutMap[index]['calorie'],
              ));
      workOutList.sort(((a, b) => b.registryDate.compareTo(a.registryDate)));
      return workOutList;
    }
  }

  static Future<WorkOutDetailView> getWorkOutDetail(int id) async {
    final List<Map> workOutMap =
        await database!.query(tableName, where: 'id = ?', whereArgs: [id]);
    if (workOutMap.isEmpty) {
      return WorkOutDetailView(id, -1, '', -1, 0.0, -1, -1, 0.0);
    } else {
      List<WorkOutDetailView> workOutList = List.generate(
          workOutMap.length,
          (index) => WorkOutDetailView(
                workOutMap[index]['id'],
                workOutMap[index]['work_out_type'],
                workOutMap[index]['registry_date'],
                workOutMap[index]['calorie'],
                workOutMap[index]['load'],
                workOutMap[index]['frequency'],
                workOutMap[index]['time'],
                workOutMap[index]['distance'],
              ));
      return workOutList.first;
    }
  }
}
