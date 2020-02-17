import 'package:ChStore/bloc/main.dart';
import 'package:ChStore/model/Product.dart';
import 'package:ChStore/utility/ChTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/utility/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCart extends StatefulWidget {
  AddToCart(this.data, {this.size = 15, this.animateCart = false});
  final Product data;
  final double size;
  final bool animateCart;

  @override
  AddToCartState createState() => new AddToCartState();

  static exec(BuildContext context, Product data) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    Product existed =
        allShoppingCarts.firstWhere((p) => p.id == data.id, orElse: () => null);

    if (existed == null) {
      allShoppingCarts.add(data);
    } else {
      existed.count++;
    }

    counterBloc.add(IncrementEvent(1));
  }
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
    if (widget.animateCart) {
      System.move(_next);
    }
    counterBloc.add(IncrementEvent(1));
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      key: _buttonKey,
      color: ChColor.primary_v1_dart,
      textColor: ChColor.main,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          side: BorderSide(color: ChColor.primary_v1_dart)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("ADD", style: ChTextStyle.buttonCart(widget.size)),
          Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(Icons.add_shopping_cart, size: widget.size))
        ],
      ),
      onPressed: () => handleClick(context),
    );
  }
}
