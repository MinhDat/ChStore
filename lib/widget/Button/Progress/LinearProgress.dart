import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/Button/Progress/LinearPainter.dart';
import 'package:ChStore/utils/MixColor.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
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
          _timer.cancel();
          setState(() {
            active = LINEAR_DEACTIVE;
          });
        } else {
          setState(() {
            percentage += step;
          });
        }
      });
    }

    return Center(
      child: Container(
        height: 45,
        width: (screenSize.width - 65 * 3 - 20) / 2.0,
        margin: EdgeInsets.only(top: 35),
        child: CustomPaint(
          foregroundPainter: LinearPainter(
            lineColor: mixColor.lineColor,
            completeColor: mixColor.completeColor,
            completePercent: percentage,
            width: 2,
          ),
        ),
      ),
    );
  }
}
