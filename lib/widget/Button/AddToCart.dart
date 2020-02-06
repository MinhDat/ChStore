import 'package:ChStore/model/Product.dart';
import 'package:ChStore/utils/AppTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/utils/System.dart';
import 'package:ChStore/utils/AppColor.dart';

class AddToCart extends StatefulWidget {
  AddToCart(this.data, {this.size = 15, this.showIcon = true});
  Product data;
  final double size;
  final bool showIcon;

  @override
  AddToCartState createState() => new AddToCartState();
}

class AddToCartState extends State<AddToCart> {
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
    Product existed = allShoppingCarts.firstWhere((p) => p.id == widget.data.id,
        orElse: () => null);

    if (existed == null) {
      allShoppingCarts.add(widget.data);
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
          Text("ADD", style: AppTextStyle.buttonCart(widget.size)),
          widget.showIcon
              ? Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    Icons.add_shopping_cart,
                    size: widget.size,
                  ),
                )
              : null,
        ].where((f) => f != null).toList(),
      ),
      onPressed: () => handleClick(context),
    );
  }
}
