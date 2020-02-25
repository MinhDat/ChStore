import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter/material.dart';

import 'NoticeItem.dart';

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  final ScrollController _scrollController = ScrollController();
  bool _showHeader = NOT_SHOW_HEADER;
  final List<Widget> _widgets = List<Widget>.generate(9, (i) => NoticeItem());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      setState(() => _showHeader = _scrollController.offset > INITIAL_OFFSET);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollableView(
      floatingAppBar: FloatingAppBar(
        showHeader: _showHeader,
        header: Text("Notification", style: ChTextStyle.scrollHeader),
        identify: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10.0, top: 20),
          child: Text("Notification", style: ChTextStyle.logo),
        ),
      ),
      child: ListView(controller: _scrollController, children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          color: ChColor.foreground.withOpacity(0.1),
          child: CardWrapper(
            color: ChColor.border,
            child: Container(child: Column(children: _widgets)),
          ),
        ),
      ]),
    );
  }
}
