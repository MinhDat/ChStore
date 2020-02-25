import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

const DISABLE_SCROLL = false;
const ENABLE_SCROLL = false;
const INITIAL_OFFSET = 0.0;
// Show header type
const SHOW_HEADER = true;
const NOT_SHOW_HEADER = false;

const HAS_FOCUSED = true;
const HAS_NOT_FOCUSED = false;

class ScrollableView extends StatefulWidget {
  ScrollableView(
      {Key key,
      this.floatingAppBarTop: 0,
      this.child,
      this.focused: HAS_FOCUSED,
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
  final double floatingAppBarTop;
  final bool focused;

  @override
  _ScrollableViewState createState() => _ScrollableViewState();
}

class _ScrollableViewState extends State<ScrollableView> {
  final GlobalKey _floatingAppBarKey = GlobalKey();
  double _childTop = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Listen completed render event
    WidgetsBinding.instance.addPostFrameCallback(_onBuildCompleted);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final double _paddingTop = _childTop - (widget.focused ? 0 : 25);

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
              padding: EdgeInsets.only(top: _paddingTop),
              child: widget.child,
            ),
            widget.floatingAppBar != null
                ? Positioned(
                    key: _floatingAppBarKey,
                    top: widget.floatingAppBarTop,
                    child: widget.floatingAppBar,
                  )
                : SizedBox.shrink(),
          ],
        ));
  }

  // After rendered
  void _onBuildCompleted(_) {
    if (_floatingAppBarKey.currentContext != null) {
      final RenderBox renderBox =
          _floatingAppBarKey.currentContext.findRenderObject();

      setState(() =>
          _childTop = renderBox.size.height - System.media.padding.top - 10);
    }
  }
}
