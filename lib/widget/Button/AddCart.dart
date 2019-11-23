import 'package:flutter/material.dart';
import 'package:ChStore/utils/System.dart';

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

    chSystem.move(_next);
    chSystem.count();
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
