import 'package:flutter/material.dart';
import 'package:ChStore/utils/System.dart';
import 'package:ChStore/utils/AppColor.dart';

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
      color: appColor.redAccent100,
      textColor: appColor.white,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          side: BorderSide(color: appColor.redAccent100)),
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
