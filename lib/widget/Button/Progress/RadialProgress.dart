import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/Button/Progress/RadialPainter.dart';
import 'package:ChStore/utils/MixColor.dart';

class RadialProgress extends StatefulWidget {
  RadialProgress({this.child});
  final Widget child;

  @override
  _RadialProgressState createState() => _RadialProgressState(child: child);
}

class _RadialProgressState extends State<RadialProgress> {
  _RadialProgressState({this.child});
  final Widget child;
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
        height: 45.0,
        width: 45.0,
        margin: EdgeInsets.only(top: 35, left: 10, right: 10),
        child: CustomPaint(
          foregroundPainter: RadialPainter(
              lineColor: mixColor.lineColor,
              completeColor: mixColor.completeColor,
              completePercent: percentage,
              width: 2.0),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
