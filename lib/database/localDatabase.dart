import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

import '../consts/constant_values.dart';

Future<Database> setPath() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'socialx.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE  $newsTable (newsTitle TEXT, newsDesc TEXT, newsPublishedAt TEXT, newsSource TEXT, newsImage TEXT)',
      );
    },
    version: 1,
  );
  return database;
}

Future<void> insertData(mappedData) async {
  print('into iD');
  final db = await setPath();
  await db.insert(
    newsTable,
    mappedData,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteData() async {
  final db = await setPath();
  await db.delete(
    newsTable,
  );
}

getData() async {
  final db = await setPath();
  final maps = await db.query(newsTable);
  print('hjh');
  return maps;
}
