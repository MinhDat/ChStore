import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

class AnimateSC extends StatefulWidget {
  final Widget child;
  AnimateSC({this.child});

  @override
  State<StatefulWidget> createState() => _AnimateSCState();
}

class _AnimateSCState extends State<AnimateSC>
    with SingleTickerProviderStateMixin {
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
        widget.child,
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
      final RenderBox renderBox =
          System.keyShoppingCart.currentContext.findRenderObject();

      final _offsetCart = renderBox.localToGlobal(Offset(0, 0));
      final _sizeCart = renderBox.size;
      _end = Offset((_offsetCart.dx + _sizeCart.width / 2) / 10,
          (_offsetCart.dy + _sizeCart.height / 2) / 10);
      _offsetAnimation = _generateAnimationPosition();
      // Forward animation
      _controller.forward();
    });
  }
}
