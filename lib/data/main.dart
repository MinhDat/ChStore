import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String _path = 'ChStore.db';
  String _table = 'FirstUsage';
  String _first = 'first';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      // Delete the database
      await deleteDatabase(_path);
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.

    // Open/create the database at a given path
    var todosDatabase =
        await openDatabase(_path, version: 1, onCreate: _createDb);
    return todosDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $_table($_first INTEGER)');
  }
}
