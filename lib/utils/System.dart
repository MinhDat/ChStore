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
  static SetCartIncreaseCountCalback setCartIncreaseCountCalback;
  static SetCartDecreaseCountCalback setCartDecreaseCountCalback;

  static Function get move {
    return setPositionAnimateCalback;
  }

  static Function get countUp {
    return setCartIncreaseCountCalback;
  }

  static Function get countDown {
    return setCartDecreaseCountCalback;
  }

  static set move(SetPositionAnimateCalback function) {
    setPositionAnimateCalback = function;
  }

  static set countUp(SetCartIncreaseCountCalback function) {
    setCartIncreaseCountCalback = function;
  }

  static set countDown(SetCartDecreaseCountCalback function) {
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

typedef SetPositionAnimateCalback = void Function(AnimationOffset state);
typedef SetCartIncreaseCountCalback = void Function(int value);
typedef SetCartDecreaseCountCalback = void Function(int value);
