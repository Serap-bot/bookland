import 'dart:io';
import 'package:bookland/models/okunacaklar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class OkunacaklarServis {
  static OkunacaklarServis instance = OkunacaklarServis._internal();
  OkunacaklarServis._internal();
  factory OkunacaklarServis() {
    return instance;
  }

  Future<List<Okunacaklar>> getirOkunacaklar(bool yapildiMi) async {
    final mapList = await getOkunacaklarMaps();
    List<Okunacaklar> okunacaklarListesi = [];
    mapList.forEach((element) {
      okunacaklarListesi.add(Okunacaklar.fromMap(element));
    });
    if (yapildiMi) {
      return okunacaklarListesi.where((element) => !element.yapildiMi).toList();
    }
    return okunacaklarListesi.where((element) => element.yapildiMi).toList();
  }

  Future<List<Map<String, dynamic>>> getOkunacaklarMaps() async {
    Database db = await this.db;
    return await db.query("todos");
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "todo.db";
    final okunacaklarDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return okunacaklarDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT,kitapAdi TEXT,aciklama TEXT,yapildiMi INT)");
  }

  Future<int> ekleOkunacaklar(Okunacaklar todo) async {
    Database db = await this.db;
    return await db.insert("todos", todo.toMap());
  }

  Future<int> guncelleOkunanlari(Okunacaklar todo) async {
    Database db = await this.db;
    return await db
        .update("todos", todo.toMap(), where: "id=?", whereArgs: [todo.id]);
  }
}
