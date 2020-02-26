import 'dart:async';

import 'package:ChStore/widget/Progress/RadialPainter.dart';
import 'package:ChStore/utility/main.dart';

import 'package:flutter/material.dart';

const RADIAL_ACTIVE = true;
const RADIAL_DEACTIVE = false;

const RADIUS_SIZE = 40.0;

class RadialProgress extends StatefulWidget {
  final Widget child;
  final bool active;
  RadialProgress({Key key, this.child, this.active}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RadialProgressState();
}

class RadialProgressState extends State<RadialProgress> {
  double _percentage;
  Timer _timer;
  double _step;
  bool _active;

  @override
  void initState() {
    super.initState();
    _percentage = 0.0;
    _step = 1.0;
    _active = widget.active != null;
    _percentProgress();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null && _timer.isActive) _timer.cancel();
  }

  void reset(bool enable) {
    setState(() {
      _percentage = 0.0;
      _step = 1.0;
      if (enable) {
        _active = RADIAL_ACTIVE;
      } else {
        _active = RADIAL_DEACTIVE;
      }
      _percentProgress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: RADIUS_SIZE,
        width: RADIUS_SIZE,
        margin: EdgeInsets.only(left: 10, right: 10),
        child: CustomPaint(
          foregroundPainter: RadialPainter(
              lineColor: AppColor.initialization,
              completeColor: AppColor.complete,
              completePercent: _percentage,
              width: 2.0),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: RADIUS_SIZE,
              width: RADIUS_SIZE,
              decoration:
                  BoxDecoration(color: AppColor.main, shape: BoxShape.circle),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }

  void _percentProgress() {
    if (_timer != null && _timer.isActive) _timer.cancel();
    if (_active) {
      _timer = Timer(Duration(milliseconds: 10), () {
        if (_percentage <= 20) {
          setState(() {
            _step++;
          });
        }
        if (_percentage < 100 && _percentage >= 80 && _step > 0) {
          setState(() {
            _step--;
          });
        }
        if (_percentage >= 100.0) {
          if (_timer != null && _timer.isActive) _timer.cancel();
          setState(() {
            _active = RADIAL_DEACTIVE;
          });
        } else {
          setState(() {
            _percentage += _step;
          });
        }
        _percentProgress();
      });
    }
  }
}
