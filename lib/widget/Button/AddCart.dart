import 'package:ChStore/data/Product.dart';
import 'package:ChStore/utils/AppTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/utils/System.dart';
import 'package:ChStore/utils/AppColor.dart';

class AddCart extends StatefulWidget {
  AddCart({this.data});
  Product data;

  @override
  AddCartState createState() => new AddCartState(data: data);
}

class AddCartState extends State<AddCart> {
  AddCartState({this.data});
  Product data;
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
        AnimationOffset(begin: currentOffset, end: System.shoppingCartOffset);
    Product existed =
        allShoppingCarts.firstWhere((p) => p.id == data.id, orElse: () => null);

    if (existed == null) {
      allShoppingCarts.add(data);
    } else {
      existed.count++;
    }

    System.move(_next);
    System.countUp(1);
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      key: _buttonKey,
      color: AppColor.redAccent100,
      textColor: AppColor.white,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          side: BorderSide(color: AppColor.redAccent100)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Add Cart", style: AppTextStyle.button),
            Icon(Icons.add_shopping_cart),
          ]),
      onPressed: () => handleClick(context),
    );
  }
}
