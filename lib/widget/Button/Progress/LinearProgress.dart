import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/Button/Progress/LinearPainter.dart';
import 'package:ChStore/utils/MixColor.dart';

class LinearProgress extends StatefulWidget {
  @override
  _LinearProgressState createState() => _LinearProgressState();
}

class _LinearProgressState extends State<LinearProgress> {
  double percentage;
  Timer _timer;
  double step;

  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0;
      step = 1.0;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    _timer = Timer(Duration(milliseconds: 10), () {
      if (percentage <= 20) {
        setState(() {
          step++;
        });
      }
      if (percentage < 100 && percentage >= 80 && step > 0) {
        setState(() {
          step--;
        });
      }
      if (percentage >= 100.0) {
        _timer.cancel();
      } else {
        setState(() {
          percentage += step;
        });
      }
    });

    return Center(
      child: Container(
        height: 45,
        width: (screenSize.width - 65.0 * 3.0) / 2.0,
        margin: EdgeInsets.only(top: 35.0),
        child: CustomPaint(
          foregroundPainter: LinearPainter(
            lineColor: mixColor.lineColor,
            completeColor: mixColor.completeColor,
            completePercent: percentage,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
