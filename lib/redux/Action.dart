import 'package:ChStore/utils/System.dart';
import 'package:ChStore/redux/Constant.dart';

class AnimatePositionAction {
  Constants type;
  AnimationOffset animationOffset;
  AnimatePositionAction(this.type, {this.animationOffset});
}
