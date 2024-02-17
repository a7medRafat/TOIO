import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? db;
  static const String tableName = 'toio';

  Future<Database> get database async {
    if (db != null) {
      return db!;
    }

    db = await initDatabase();
    return db!;
  }

  Future<Database> initDatabase() async {
    return await openDatabase('TOIO', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE $tableName (id INTEGER PRIMARY KEY,
            title TEXT,
            time INTEGER,
            date TEXT,
            expiration TEXT,
            type TEXT,
            status TEXT,
            isFav TEXT,
          )
        ''');
    }, onOpen: (db) {

        });
  }
}
