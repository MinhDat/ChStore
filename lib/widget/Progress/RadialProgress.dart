import 'dart:async';

import 'package:ChStore/widget/Progress/RadialPainter.dart';
import 'package:ChStore/utils/main.dart';

import 'package:flutter/material.dart';

const RADIAL_ACTIVE = true;
const RADIAL_DEACTIVE = false;

class RadialProgress extends StatefulWidget {
  final Widget child;
  final bool active;
  RadialProgress({Key key, this.child, this.active}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RadialProgressState();
}

class RadialProgressState extends State<RadialProgress> {
  double percentage;
  Timer _timer;
  double step;
  bool active;

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
    super.dispose();
    if (_timer != null && _timer.isActive) _timer.cancel();
  }

  void reset(bool enable) {
    setState(() {
      percentage = 0.0;
      step = 1.0;
      if (enable) {
        active = RADIAL_ACTIVE;
      } else {
        active = RADIAL_DEACTIVE;
      }
      _percentProgress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 45.0,
        width: 45.0,
        margin: EdgeInsets.only(left: 10, right: 10),
        child: CustomPaint(
          foregroundPainter: RadialPainter(
              lineColor: ChColor.main,
              completeColor: ChColor.complete,
              completePercent: percentage,
              width: 2.0),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                color: ChColor.main,
                shape: BoxShape.circle,
              ),
              child: widget.child,
            ),
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
            active = RADIAL_DEACTIVE;
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
