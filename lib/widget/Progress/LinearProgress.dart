import 'dart:async';

import 'package:ChStore/widget/Progress/LinearPainter.dart';
import 'package:ChStore/utility/main.dart';

import 'package:flutter/material.dart';

const LINEAR_ACTIVE = true;
const LINEAR_DEACTIVE = false;

class LinearProgress extends StatefulWidget {
  final bool active;
  LinearProgress({Key key, this.active}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return LinearProgressState();
  }
}

class LinearProgressState extends State<LinearProgress> {
  bool active;
  double percentage;
  Timer _timer;
  double step;

  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0;
      step = 1.0;
      active = widget.active != null;
    });
    _percentProgress();
  }

  @override
  void dispose() {
    if (_timer != null && _timer.isActive) _timer.cancel();
    super.dispose();
  }

  void reset(bool enable) {
    setState(() {
      percentage = 0.0;
      step = 1.0;
      if (enable) {
        active = LINEAR_ACTIVE;
      } else {
        active = LINEAR_DEACTIVE;
      }
      _percentProgress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 45,
        width: (System.screenSize.width - 65 * 3 - 20) / 2.0,
        child: CustomPaint(
          foregroundPainter: LinearPainter(
            lineColor: ChColor.main,
            completeColor: ChColor.complete,
            completePercent: percentage,
            width: 2,
          ),
        ),
      ),
    );
  }

  void _percentProgress() {
    if (_timer != null && _timer.isActive) _timer.cancel();
    if (active) {
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
          if (_timer != null && _timer.isActive) _timer.cancel();
          setState(() {
            active = LINEAR_DEACTIVE;
          });
        } else {
          setState(() {
            percentage += step;
          });
        }
        _percentProgress();
      });
    }
  }
}
