import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:ChStore/utils/System.dart';
import 'package:ChStore/redux/Action.dart';
import 'package:ChStore/redux/Constant.dart';

class AddCart extends StatefulWidget {
  @override
  AddCartState createState() => new AddCartState();
}

class AddCartState extends State<AddCart> {
  GlobalKey _buttonKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  handleClick(BuildContext context) {
    final RenderBox renderBoxRed = _buttonKey.currentContext.findRenderObject();
    final currentOffset = renderBoxRed.localToGlobal(Offset.zero);
    AnimationOffset _next =
        AnimationOffset(begin: currentOffset, end: chSystem.shoppingCartOffset);

    StoreProvider.of<AnimationOffset>(context).dispatch(AnimatePositionAction(
        Constants.AddShoppingCart,
        animationOffset: _next));
    chSystem.move(_next);
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      key: _buttonKey,
      color: Colors.green[400],
      textColor: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Add Cart"),
            Icon(Icons.add_shopping_cart),
          ]),
      onPressed: () => handleClick(context),
    );
  }
}
