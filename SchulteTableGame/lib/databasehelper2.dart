import 'package:mpodevdeneme6/model2.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';




class DatabaseHelper2 {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "High.db");

    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE High(high INTEGER)");
  }

  Future<List<Map<String, dynamic>>> getHigh() async {
    var dbclient = await db;
    var result = dbclient.query("High");

    return result;
  }


   Future<int> highPuanlar(High high) async {
    var dbclient = await db;
    var result = dbclient.insert("High", high.toMap());

    return result;

  }

    Future<int> toplamHarcamalarGetir() async {
    var dbclient = await db;

    List<Map> list = await dbclient
        .rawQuery("select MAX(high) as high from High");
    return list.isNotEmpty ? list[0]["high"] : Null;
  }

   
}
