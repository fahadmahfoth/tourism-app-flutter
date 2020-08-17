import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:tourism/src/models/favorite_model.dart';

class DatabaseHelper {
  static Database _db;
  final String favoriteTable = 'favoriteTable';
  final String id_col = 'id';
  final String categoryId_col = 'categoryId';
  final String name_col = 'name';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await intDB();
    return _db;
  }

  intDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'mydb.db');
    var myOwnDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myOwnDB;
  }

  void _onCreate(Database db, int newVersion) async {
    try {
      await db.execute('''CREATE TABLE favoriteTable (id INTEGER PRIMARY KEY,
         category_id INTEGER,name TEXT,contente TEXT,phone_number TEXT,city TEXT,time_up TEXT,time_down TEXT,
         days TEXT,image TEXT,map_lat TEXT,map_lng TEXT)''');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<int> saveFavorite(Favorite favorite) async {
    try {
      var dbClient = await db;
      int result = await dbClient.insert("$favoriteTable", favorite.toMap());
      return result;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> getAllFavorite() async {
    try {
      var dbClient = await db;
      var sql = "SELECT * FROM $favoriteTable";
      List result = await dbClient.rawQuery(sql);
      return result.toList();
    } catch (e) {
      print(e.toString());
    }
  }

  getFavorite(int id) async {
    try {
      var dbClient = await db;
      var sql = "SELECT * FROM $favoriteTable WHERE $id_col = $id";
      var result = await dbClient.rawQuery(sql);
      if (result.length == 0) return 0;
      return result.first;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<int> deleteFavorite(int id) async {
    try {
      var dbClient = await db;
      return await dbClient
          .delete(favoriteTable, where: "$id_col = ?", whereArgs: [id]);
    } catch (e) {
      print(e.toString());
    }
  }

  close() async {
    try {
      var dbClient = await db;
      return await dbClient.close();
    } catch (e) {
      print(e.toString());
    }
  }
}
