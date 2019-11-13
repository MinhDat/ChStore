import 'package:ChStore/redux/Constant.dart';
import 'package:ChStore/utils/System.dart';

AnimationOffset animatePositionReducer(AnimationOffset state, dynamic action) {
  if (action.type == Constants.AddShoppingCart) {
    return action.animationOffset;
  }

  return state;
}
