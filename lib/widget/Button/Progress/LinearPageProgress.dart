import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/Button/Progress/LinearPagePainter.dart';
import 'package:ChStore/utils/ChColor.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
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
    _timer = Timer(Duration(milliseconds: 90), () {
      if (widget.active) {
        if (percentage >= 100.0) {
          if (_timer.isActive) _timer.cancel();
          setState(() {
            percentage = percentage;
          });
        } else {
          setState(() {
            percentage += step;
          });
        }
      }
    });

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
}

typedef FunctionCallback = void Function();
