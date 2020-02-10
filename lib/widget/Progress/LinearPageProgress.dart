import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/Progress/LinearPagePainter.dart';
import 'package:ChStore/utils/main.dart';

class LinearPageProgress extends StatefulWidget {
  bool active;
  final int seconds;
  LinearPageProgress({Key key, this.active: false, this.seconds})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return LinearPageProgressState();
  }
}

class LinearPageProgressState extends State<LinearPageProgress> {
  double percentage = 0.0;
  Timer _timer;
  double step;

  @override
  void initState() {
    super.initState();
    step = 10.0 / widget.seconds;
    _percentProgress();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null && _timer.isActive) _timer.cancel();
  }

  void setProgress(int state) {
    switch (state) {
      case 0:
        setState(() {
          percentage = 0.0;
          widget.active = true;
        });
        break;
      case 1:
        setState(() {
          percentage = 0.0;
          widget.active = false;
        });
        break;
      case 2:
        setState(() {
          percentage = 100.0;
          widget.active = false;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 5,
        width: 20,
        margin: EdgeInsets.only(top: 35),
        child: CustomPaint(
          foregroundPainter: LinearPagePainter(
            lineColor: ChColor.initialization,
            completeColor: ChColor.main,
            completePercent: percentage,
            width: 5,
          ),
        ),
      ),
    );
  }

  void _percentProgress() {
    if (_timer != null && _timer.isActive) _timer.cancel();
    _timer = Timer(Duration(milliseconds: 90), () {
      if (widget.active) {
        if (percentage >= 100.0) {
          setState(() {
            percentage = percentage;
          });
        } else {
          setState(() {
            percentage += step;
          });
        }
      }
      _percentProgress();
    });
  }
}

typedef FunctionCallback = void Function();
