import 'package:beer_collection/entities/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDbProvider {
  static Database? database;
  static const String tableName = 'user';

  static Future<void> _createTable(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, user_name TEXT, height REAL, weight REAL);');
  }

  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'user.db');
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

  static Future<void> insertUserData(RequestUser user) async {
    await database!.insert(tableName, {
      'user_name': user.userName,
      'height': user.height,
      'weight': user.weight,
    });
  }

  static Future<List<UserView>> getUserData() async {
    final List<Map<String, dynamic>> userMap = await database!.query(tableName);

    if (userMap.isEmpty) {
      return [];
    } else {
      List<UserView> userList = List.generate(
          userMap.length,
          (index) => UserView(
                userMap[index]['id'],
                userMap[index]['user_name'],
                userMap[index]['height'],
                userMap[index]['weight'],
              ));
      return userList;
    }
  }
}
