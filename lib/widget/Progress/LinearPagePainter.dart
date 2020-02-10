import 'package:flutter/rendering.dart';

class LinearPagePainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  LinearPagePainter(
      {this.lineColor, this.completeColor, this.completePercent, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(0.0, size.height / 2);
    final p2 = Offset(size.width, size.height / 2);
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = this.width
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(p1, p2, paint);
    Offset percentPoint =
        Offset(size.width * this.completePercent / 100.0, size.height / 2);
    final percentPaint = Paint()
      ..color = completeColor.withOpacity(this.completePercent == 0 ? 0 : 1)
      ..strokeWidth = this.width
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(p1, percentPoint, percentPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
