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
  SetCartCounterCalback setCartCounterCalback;

  Function get move {
    return setPositionAnimateCalback;
  }

  Function get count {
    return setCartCounterCalback;
  }

  set move(SetPositionAnimateCalback function) {
    setPositionAnimateCalback = function;
  }

  set count(SetCartCounterCalback function) {
    setCartCounterCalback = function;
  }
}

var chSystem = System();

typedef SetPositionAnimateCalback = void Function(AnimationOffset state);
typedef SetCartCounterCalback = void Function();
