import 'package:goys_boarding_house/models/restaurant_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static const String _tableFavorite = 'favorites';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'restolists.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableFavorite (
            id TEXT PRIMARY KEY,
            name TEXT,
            description TEXT,
            pictureId TEXT,
            city TEXT,
            rating REAL
          )''');
      },
      version: 1,
    );
    return db;
  }

  //=======================> METHOD FAVORITED <=========================//

  // add favorite
  Future<void> insertFavorite(RestaurantModel restaurant) async {
    final Database db = await database;
    await db.insert(_tableFavorite, restaurant.toJson());
  }

  // menampilkan seluruh data yang sudah di add favorite
  Future<List<RestaurantModel>> getFavorite() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableFavorite);

    return results.map((res) => RestaurantModel.fromJson(res)).toList();
  }

  // mengambil data dengan id
  Future<Map> getFavoriteById(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  // fungsi menghapus data favorite
  Future<void> deleteFavorite(String id) async {
    final db = await database;

    await db.delete(
      _tableFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Future<void> updateFavorite(RestaurantModel restaurant) async {
  //   final db = await database;

  //   await db.update(
  //     _tableFavorite,
  //     restaurant.toJson(),
  //     where: 'id = ?',
  //     whereArgs: [restaurant.id],
  //   );
  // }
}
