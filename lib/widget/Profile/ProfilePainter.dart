import 'package:flutter/rendering.dart';
import 'dart:math';

class ProfilePainter extends CustomPainter {
  ProfilePainter({this.color});
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, 3 * size.height / 4);
    final paint = Paint()..color = this.color;
    canvas.drawRect(rect, paint);

    double curvedLength =
        sqrt(pow(size.height / 4, 2) + pow(size.width / 2, 2));
    double radius = (4 * pow(curvedLength, 2)) / (2 * size.height);
    double arcAngle = 2 * asin(size.width / (2 * radius));
    Offset center = new Offset(size.width / 2, size.height - radius);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius),
        (pi - arcAngle) / 2, arcAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
