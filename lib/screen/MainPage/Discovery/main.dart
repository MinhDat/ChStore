import 'CategoryView.dart';
import 'TopicView.dart';

import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';

class Discovery extends StatefulWidget {
  @override
  _DiscoveryState createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery> {
  final ScrollController _scrollController = ScrollController();
  bool _showHeader = NOT_SHOW_HEADER;

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
        header: Text("Discovery", style: Style.scrollHeader),
        identify: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10.0, top: 20),
          child: Text("Discovery", style: Style.logo),
        ),
      ),
      child: ListView(controller: _scrollController, children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          color: AppColor.foreground.withOpacity(0.1),
          child: Column(
            children: <Widget>[
              CardWrapper(
                label: Text('Categories', style: Style.title),
                child: CategoryView(),
              ),
              CardWrapper(
                label: Text('Topics', style: Style.title),
                child: TopicView(context),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
