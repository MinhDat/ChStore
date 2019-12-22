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

// class Preference {
//   final key = 'first_usage';
//   static bool _firstUsage;

//   bool get firstUsage {
//     bool data = await _read();
//     return data;
//   }

//   set firstUsage(bool value) {
//     _save(value);
//   }

//   Future<bool> _read() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(key);
//   }

//   _save(bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool(key, value);
//   }
// }

class System {
  static String key = 'first_usage';
  Offset shoppingCartOffset = Offset(0, 0);
  SetPositionAnimateCalback setPositionAnimateCalback;
  SetCartIncreaseCountCalback setCartIncreaseCountCalback;
  SetCartDecreaseCountCalback setCartDecreaseCountCalback;

  Function get move {
    return setPositionAnimateCalback;
  }

  Function get countUp {
    return setCartIncreaseCountCalback;
  }

  Function get countDown {
    return setCartDecreaseCountCalback;
  }

  set move(SetPositionAnimateCalback function) {
    setPositionAnimateCalback = function;
  }

  set countUp(SetCartIncreaseCountCalback function) {
    setCartIncreaseCountCalback = function;
  }

  set countDown(SetCartDecreaseCountCalback function) {
    setCartDecreaseCountCalback = function;
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

var chSystem = System();

typedef SetPositionAnimateCalback = void Function(AnimationOffset state);
typedef SetCartIncreaseCountCalback = void Function(int value);
typedef SetCartDecreaseCountCalback = void Function(int value);
