import 'package:ChStore/widget/Button/Progress/LinearPageProgress.dart';
import 'package:flutter/material.dart';

class ProgressList extends StatefulWidget {
  final List<GlobalKey<LinearPageProgressState>> activations;
  final int seconds;
  ProgressList({this.activations, this.seconds: 7});
  @override
  _ProgressListState createState() => _ProgressListState();
}

class _ProgressListState extends State<ProgressList> {
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
