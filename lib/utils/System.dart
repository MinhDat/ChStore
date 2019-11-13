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

  Function get move {
    return setPositionAnimateCalback;
  }

  set move(SetPositionAnimateCalback function) {
    setPositionAnimateCalback = function;
  }
}

var chSystem = System();

typedef SetPositionAnimateCalback = void Function(AnimationOffset state);
