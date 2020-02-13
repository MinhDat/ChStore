import 'package:ChStore/bloc/main.dart';
import 'package:ChStore/model/Product.dart';
import 'package:ChStore/utility/ChTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/utility/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCart extends StatefulWidget {
  AddToCart(this.data, {this.size = 15, this.showIcon = true});
  final Product data;
  final double size;
  final bool showIcon;

  @override
  AddToCartState createState() => new AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  GlobalKey _buttonKey = GlobalKey();

  handleClick(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    final RenderBox renderBoxRed = _buttonKey.currentContext.findRenderObject();
    final _offset = renderBoxRed.localToGlobal(Offset.zero);
    final _size = renderBoxRed.size;
    AnimationOffset _next = AnimationOffset(
        begin:
            Offset(_offset.dx + _size.width / 2, _offset.dy + _size.height / 2),
        end: System.shoppingCartOffset);
    Product existed = allShoppingCarts.firstWhere((p) => p.id == widget.data.id,
        orElse: () => null);

    if (existed == null) {
      allShoppingCarts.add(widget.data);
    } else {
      existed.count++;
    }
    if (!widget.showIcon) {
      System.move(_next);
    }
    counterBloc.add(IncrementEvent(1));
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      key: _buttonKey,
      color: ChColor.primaryLight,
      textColor: ChColor.main,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          side: BorderSide(color: ChColor.primaryLight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(widget.showIcon ? "ADD TO CART" : "ADD",
              style: ChTextStyle.buttonCart(widget.size)),
          widget.showIcon
              ? Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(Icons.add_shopping_cart, size: widget.size),
                )
              : SizedBox.shrink()
        ],
      ),
      onPressed: () => handleClick(context),
    );
  }
}
