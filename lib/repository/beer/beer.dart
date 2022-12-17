import 'package:beer_collection/entities/beer.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static Database? database;
  static const String tableName = 'beer';

  static Future<void> _createTable(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, beer_name TEXT, beer_style INTEGER, alcohol_degree REAL, calorie INTEGER, image TEXT, registry_date_time TEXT);'
    );
  }

  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'beer.db');
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

    static Future<void> insertData(Beer beer) async {
    await database!.insert(tableName, {
      'beer_name': beer.beerName,
      'beer_style': beer.beerStyle,
      'alcohol_degree': beer.alcoholDegree,
      'calorie': beer.calorie,
      'image': beer.image,
      'registry_date_time': beer.registryDateTime
    });
  }
}