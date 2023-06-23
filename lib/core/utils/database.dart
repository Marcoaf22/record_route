import 'package:path/path.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseInventory {
  void createTable() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, Auth.instance.db);
    print(path);
    Database database =
        await openDatabase(path, version: 1, onCreate: ((db, version) async {
      loadTables(db);
    }));
    loadTables(database);
  }

  void loadTables(Database db) async {
//     await db.execute('''
//     drop table if exists locations;
// ''');
    final locations = await db.execute('''
          CREATE TABLE IF NOT EXISTS locations (
            id INTEGER , 
            latitude TEXT, 
            longitude TEXT, 
            route_id INT,
            date_time TEXT
          )
        ''');
  }

  static Future<Database> openDB() async {
    String path = join(await getDatabasesPath(), Auth.instance.db);
    print(path);
    return openDatabase(path, onCreate: ((db, version) {}), version: 1);
  }
}
