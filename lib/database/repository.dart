import 'package:flutter_mobile_uas2/database/db.halper.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DbHelper _databaseConnection;
  Repository() {
    _databaseConnection = DbHelper();
  }

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  //tambah data
  insertMhs(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  //baca data
  readMhs(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  //Update Mhs
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //hapus data
  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection
        ?.rawDelete("delete from mahasiswa where id=$itemId");
  }
}
