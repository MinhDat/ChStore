import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:ChStore/data/main.dart';

const ENABLE_USAGE_GUIDE = false;

class System {
  static MediaQueryData media;
  static SetOffsetAnimateCalback setPositionAnimateCalback;
  static DatabaseHelper databaseHelper = DatabaseHelper();
  static GlobalKey keyShoppingCart = GlobalKey();
  static GlobalKey keyShoppingCartSecond = GlobalKey();

  static Function get move {
    return setPositionAnimateCalback;
  }

  static set move(SetOffsetAnimateCalback function) {
    setPositionAnimateCalback = function;
  }

  static Future<bool> get firstUsage async {
    final Database database = await databaseHelper.initializeDatabase();

    int _first = Sqflite.firstIntValue(
        await database.rawQuery('SELECT * FROM FirstUsage'));
    await database.close();

    if (ENABLE_USAGE_GUIDE) return true;
    return _first == null ? true : _first == 1;
  }

  static setFirstUsage(bool value) async {
    final Database database = await databaseHelper.initializeDatabase();
    await database.insert('FirstUsage', {'first': 0});
    await database.close();
  }
}

typedef SetOffsetAnimateCalback = void Function(Offset state);
