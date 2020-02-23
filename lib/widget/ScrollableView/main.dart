import 'package:flutter/material.dart';

import 'Constant.dart';

class ScrollableView extends StatefulWidget {
  ScrollableView(
      {Key key,
      this.floatingAppBarTop: FLOATING_APP_BAR_TOP,
      this.child,
      this.controller,
      this.floatingAppBar})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Widget child;
  final Widget floatingAppBar;
  final ScrollController controller;
  final double floatingAppBarTop;

  @override
  _ScrollableViewState createState() => _ScrollableViewState();
}

class _ScrollableViewState extends State<ScrollableView> {
  double _floatingAppBarTop = FLOATING_APP_BAR_TOP;
  GlobalKey _floatingAppBarKey = GlobalKey();
  double _childTop = 0;
  double _topTransform = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Listen completed render event
    WidgetsBinding.instance.addPostFrameCallback(_onBuildCompleted);

    widget.controller.addListener(() {
      // Focused in search box
      double tmp = widget.floatingAppBarTop - widget.controller.offset;
      setState(() {
        _floatingAppBarTop = tmp > 0
            ? tmp > widget.floatingAppBarTop ? widget.floatingAppBarTop : tmp
            : 0;
        _topTransform = widget.floatingAppBarTop - _floatingAppBarTop + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/asset/image/background/bg1_body.jpg"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: _childTop - _topTransform),
              child: widget.child,
            ),
            widget.floatingAppBar != null
                ? Positioned(
                    key: _floatingAppBarKey,
                    top: _floatingAppBarTop,
                    child: widget.floatingAppBar,
                  )
                : SizedBox.shrink(),
          ],
        ));
  }

  // After rendered
  void _onBuildCompleted(_) {
    final RenderBox renderBox =
        _floatingAppBarKey.currentContext.findRenderObject();
    setState(() {
      _childTop = renderBox.size.height;
    });
  }
}
