import 'package:flutter/material.dart';
import 'package:ChStore/widget/Progress/LinearPageProgress.dart';

class ProgressLoading extends StatefulWidget {
  final List<GlobalKey<LinearPageProgressState>> activations;
  final int seconds;
  ProgressLoading({this.activations, this.seconds: 7});
  @override
  _ProgressLoadingState createState() => _ProgressLoadingState();
}

class _ProgressLoadingState extends State<ProgressLoading> {
  List<Widget> _widgetList;

  @override
  void initState() {
    // TODO: implement initState
    _widgetList = [];
    for (int i = 0; i < widget.activations.length; i++) {
      _widgetList.add(
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: LinearPageProgress(
            key: widget.activations[i],
            seconds: widget.seconds,
            active: i == 0 ? true : false,
          ),
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center, children: _widgetList);
  }
}
