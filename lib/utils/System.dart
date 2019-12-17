import 'dart:ui';

class AnimationOffset {
  AnimationOffset({
    this.begin = const Offset(0, 0),
    this.end = const Offset(0, 0),
  });
  Offset begin;
  Offset end;
}

class System {
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
}

var chSystem = System();

typedef SetPositionAnimateCalback = void Function(AnimationOffset state);
typedef SetCartIncreaseCountCalback = void Function(int value);
typedef SetCartDecreaseCountCalback = void Function(int value);
