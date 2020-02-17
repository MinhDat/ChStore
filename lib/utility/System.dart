import 'dart:ui';
import 'package:sqflite/sqflite.dart';

import 'package:ChStore/data/main.dart';

const ENABLE_USAGE_GUIDE = false;

class AnimationOffset {
  AnimationOffset({
    this.begin = const Offset(0, 0),
    this.end = const Offset(0, 0),
  });
  Offset begin, end;
}

class System {
  static Offset shoppingCartOffset = Offset(0, 0);
  static Size screenSize;
  static SetPositionAnimateCalback setPositionAnimateCalback;
  static DatabaseHelper databaseHelper = DatabaseHelper();

  static Function get move {
    return setPositionAnimateCalback;
  }

  static set move(SetPositionAnimateCalback function) {
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

typedef SetPositionAnimateCalback = void Function(AnimationOffset state);
