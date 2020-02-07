import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class AnimationOffset {
  AnimationOffset({
    this.begin = const Offset(0, 0),
    this.end = const Offset(0, 0),
  });
  Offset begin;
  Offset end;
}

class System {
  static String key = 'first_usage';
  static Offset shoppingCartOffset = Offset(0, 0);
  static Size screenSize;
  static SetPositionAnimateCalback setPositionAnimateCalback;

  static Function get move {
    return setPositionAnimateCalback;
  }

  static set move(SetPositionAnimateCalback function) {
    setPositionAnimateCalback = function;
  }

  static Future<bool> get firstUsage async {
    final prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool(key);
    return value == null ? true : value;
  }

  static setFirstUsage(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }
}

typedef SetPositionAnimateCalback = void Function(AnimationOffset state);
