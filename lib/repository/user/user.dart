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

  static Future<Database> _requireDb() async {
    return await setDb() ?? await initDb();
  }

  static Future<void> insertUserData(RequestUser user) async {
    final db = await _requireDb();
    final existingUsers = await db.query(tableName, limit: 1);

    final data = {
      'user_name': user.userName,
      'height': user.height,
      'weight': user.weight,
    };

    if (existingUsers.isEmpty) {
      await db.insert(tableName, data);
      return;
    }

    await db.update(
      tableName,
      data,
      where: 'id = ?',
      whereArgs: [existingUsers.first['id']],
    );
  }

  static Future<UserView> getUserData() async {
    final db = await _requireDb();
    final List<Map<String, dynamic>> userMap = await db.query(
      tableName,
      orderBy: 'id DESC',
      limit: 1,
    );

    if (userMap.isEmpty) {
      return UserView(0, '未登録', 0.0, 0.0);
    } else {
      List<UserView> userList = List.generate(
          userMap.length,
          (index) => UserView(
                userMap[index]['id'],
                userMap[index]['user_name'],
                userMap[index]['height'],
                userMap[index]['weight'],
              ));
      return userList.first;
    }
  }

  static Future<void> updateUserData(UserView user) async {
    final db = await _requireDb();
    await db.update(
        tableName,
        {
          'user_name': user.userName,
          'height': user.height,
          'weight': user.weight,
        },
        where: 'id = ?',
        whereArgs: [user.id]);
  }
}
