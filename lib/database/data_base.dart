import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static const USER_TABLE = 'Users';
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'db_helperrr.db'),
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE IF NOT EXISTS $USER_TABLE(id TEXT PRIMARY KEY ,'
            ' productName TEXT,'
            ' productPrice TEXT,'
            ' productImage TEXT)');
      },
      version: 1,
    );
  }

  insertData(
    String name,
    String price,
    String image,
  ) async {
    int randomNumber = Random().nextInt(800);
    final db = await SqlDb.database();
    int? respons = await db.insert(USER_TABLE, {
      'id': randomNumber.toString(),
      'productName': name,
      'productPrice': price,
      'productImage': image,
    });
    debugPrint('====$name======$price');
  }

  Future<List<Map>?> SelectData() async {
    final db = await SqlDb.database();
    List<Map<String, Object?>>? respons =
        await db.rawQuery(''' SELECT * FROM $USER_TABLE''');
    debugPrint(respons.toString());
    return respons;
  }

  delateData(String idd) async {
    final db = await SqlDb.database();
    int? respons =
        await db.rawDelete(''' DELETE  FROM $USER_TABLE WHERE id = '$idd' ''');
  }

  Future<void> updateProducById(id, name, price, image) async {
    final db = await SqlDb.database();
    await db.update(
      USER_TABLE,
      {'productName': name, 'productPrice': price, 'productImage': image},
      where: "id = ?",
      whereArgs: [id],
    );
  }
}

// updatetData(String update) async {
//    final db = await SqlDb.database();
//   int respons = await db.rawUpdate(update);
//  return respons;
//  }

//   static Database? _db;
//   final String USER_TABLE = 'Usersr';

//   Future<Database?> get db async {
//     if (_db == null) {
//       _db = await Initial();
//       return _db;
//     } else {
//       return _db;
//     }
//   }

//   Initial() async {
//     String path = join(await getDatabasesPath(), 'omtt3666.db'); //apth and name
//     Database Mydb = await openDatabase(path,
//         onCreate: _onCreate, version: 3, onUpgrade: _upgrade); //open database
//     return Mydb;
//   }

//   _upgrade(Database db, int oldvertion, int newvertion) async {
//     await db.execute("ALTER TABLE $USER_TABLE ADD COLUMN color TEXT");
//   }

// //انشاء الجداول
//   _onCreate(Database db, int vertion) async {
//     await db.execute('''
//     CREATE TABLE $USER_TABLE(
//       id TEXT PRIMARY KEY ,
//      "name" TEXT NOT NULL ,
//      "price" TEXT NOT NULL
//     )
// ''');
//   }
