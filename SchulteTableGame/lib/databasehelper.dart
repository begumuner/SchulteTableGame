import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

import 'model.dart';


class DatabaseHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "Puanlar.db");

    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE Puanlar(puan TEXT)");
  }

  Future<List<Map<String, dynamic>>> getPuanlar() async {
    var dbclient = await db;
    var result = dbclient.query("Puanlar");

    return result;
  }

  Future<List<Puanlar>> getPuanList() async {
    var map = await getPuanlar();
    var PuanListesi = List<Puanlar>();

    for (Map m in map) {
      PuanListesi.add(Puanlar.fromMap(m));
    }
    return PuanListesi;
  }

   Future<String> insertPuanlar(Puanlar p) async {
    var dbclient = await db;
    var result = dbclient.insert("Puanlar", p.toMap());

    return result.toString();
  }

  Future<int> puanSil(int katID) async{
    var dbclient = await db;
    var sonuc=await dbclient.delete("Puanlar",where: 'puan=?');
    return sonuc;
  }
    

   
}
