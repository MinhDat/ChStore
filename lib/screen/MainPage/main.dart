import 'package:ChStore/bloc/main.dart';
import 'package:ChStore/screen/main.dart';
import 'package:ChStore/utility/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Mainpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainpageState();
  }
}

class _MainpageState extends State<Mainpage>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  AnimationController _controller;
  Offset _begin = Offset.zero;
  Offset _end = Offset.zero;
  Animation _offsetAnimation;
  double _visibleAnimate = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _visibleAnimate = 0.0;
            _controller.reset();
          });
        }
      });

    _offsetAnimation = _generateAnimationPosition();
    System.move = _handleAnimation;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: _navigateToScreen(_index),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (int index) {
              setState(() {
                _index = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: new Image.asset('icon/today-icon.png',
                    height: 22,
                    width: 22,
                    color: _index == 0 ? ChColor.primary : ChColor.unfocus),
                title: SizedBox.shrink(),
              ),
              BottomNavigationBarItem(
                icon: new Image.asset('icon/toggle-menu-icon.png',
                    height: 22,
                    width: 22,
                    color: _index == 1 ? ChColor.primary : ChColor.unfocus),
                title: SizedBox.shrink(),
              ),
              BottomNavigationBarItem(
                icon: new Image.asset('icon/search-icon.png',
                    height: 22,
                    width: 22,
                    color: _index == 2 ? ChColor.primary : ChColor.unfocus),
                title: SizedBox.shrink(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications,
                    color: _index == 3 ? ChColor.primary : ChColor.unfocus),
                title: SizedBox.shrink(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,
                    color: _index == 4 ? ChColor.primary : ChColor.unfocus),
                title: SizedBox.shrink(),
              ),
            ],
          ),
        ),
        SlideTransition(
          position: _offsetAnimation,
          child: Opacity(
            opacity: _visibleAnimate,
            child: Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: ChColor.primary,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _navigateToScreen(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return ProductCategory();
      case 2:
        return Search();
      case 3:
        return Notice();
      case 4:
        return Personality();
      default:
        return HomePage();
    }
  }

  // Get animation postion
  Animation _generateAnimationPosition() {
    return Tween(begin: _begin, end: _end).animate(
        new CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  // Handle moving item
  void _handleAnimation(AnimationOffset state) {
    setState(() {
      _visibleAnimate = 1.0;
      _begin = Offset(state.begin.dx / 10, state.begin.dy / 10);

      // Get offset shopping cart
      final RenderBox renderBoxRed = System.showHeader
          ? System.keyShoppingCartAppBar.currentContext.findRenderObject()
          : System.keyShoppingCartSearch.currentContext.findRenderObject();

      final _offsetCart = renderBoxRed.localToGlobal(Offset(0, 0));
      final _sizeCart = renderBoxRed.size;
      _end = Offset((_offsetCart.dx + _sizeCart.width / 2) / 10,
          (_offsetCart.dy + _sizeCart.height / 2) / 10);
      _offsetAnimation = _generateAnimationPosition();
      // Forward animation
      _controller.forward();
    });
  }
}
