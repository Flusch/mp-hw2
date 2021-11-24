//Yavuz Selim GÜLER
//1306160016
//import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future opendb(String tname) async {

  WidgetsFlutterBinding.ensureInitialized();

  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'todo_database.db'),
    onCreate: (db, version) {
      return db.execute(
        //sqflite bool desteklemiyor, onun yerine integer 0 ve 1 kullan
        "CREATE TABLE $tname(id INTEGER PRIMARY KEY, check INTEGER, definition TEXT)",
      );
    },
    version: 1,
  );
  return database;
}
/*
Future<List<Hes>> printhes() async {
    final db = await opendb();

    final List<Map<String, dynamic>> maps = await db.query('hes');

    return List.generate(maps.length, (i) {
      return Hes(
        id: maps[i]['id'],
        code: maps[i]['code'],
        definition: maps[i]['definition'],
      );
    });
  }

Future<void> insert(Hes hes) async {
    final db = await opendb();

    await db.insert(
      'hes',
      hes.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

Future<void> update(Hes hes) async {
    final db = await opendb();

    await db.update(
      'hes',
      hes.toMap(),
      where: "id = ?",
      whereArgs: [hes.id],
    );
  }

Future<void> delete(int id) async {
    final db = await opendb();

    await db.delete(
      'hes',
      where: "id = ?",
      whereArgs: [id],
    );
  }

class Hes {
  final int id;
  final String code;
  final String definition;

  Hes({this.id, this.code, this.definition});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'definition': definition,
    };
  }
}*/