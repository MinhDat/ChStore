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
  bool _active;
  double _percentage;
  Timer _timer;
  double _step;

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
    if (_timer != null && _timer.isActive) _timer.cancel();
    super.dispose();
  }

  void reset(bool enable) {
    setState(() {
      _percentage = 0.0;
      _step = 1.0;
      if (enable) {
        _active = LINEAR_ACTIVE;
      } else {
        _active = LINEAR_DEACTIVE;
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
            completePercent: _percentage,
            width: 2,
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
            _active = LINEAR_DEACTIVE;
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
