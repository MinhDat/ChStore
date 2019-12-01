import 'package:flutter/rendering.dart';

class ProfilePainter extends CustomPainter {
  Color color;
  ProfilePainter({this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height / 1.5);
    final paint = Paint()..color = this.color;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
