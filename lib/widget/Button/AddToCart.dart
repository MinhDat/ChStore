import 'package:ChStore/bloc/main.dart';
import 'package:ChStore/model/Product.dart';
import 'package:ChStore/utility/Style.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/utility/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddToCart extends StatefulWidget {
  AddToCart(this.data, {this.size = 15, this.animateCart = false});
  final Product data;
  final double size;
  final bool animateCart;

  @override
  AddToCartState createState() => new AddToCartState();

  static exec(BuildContext context, Product data) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    Product existed =
        allShoppingCarts.firstWhere((p) => p.id == data.id, orElse: () => null);

    if (existed == null) {
      allShoppingCarts.add(data);
    } else {
      existed.count++;
    }

    _counterBloc.add(IncrementEvent());
    Fluttertoast.showToast(
        msg: "Added to shopping cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: AppColor.foreground,
        textColor: AppColor.label,
        fontSize: 16.0);
  }
}

class AddToCartState extends State<AddToCart> {
  final GlobalKey _buttonKey = GlobalKey();

  handleClick(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    final RenderBox _renderBox = _buttonKey.currentContext.findRenderObject();
    final _offset = _renderBox.localToGlobal(Offset.zero);
    final _size = _renderBox.size;
    final Offset _next =
        Offset(_offset.dx + _size.width / 2, _offset.dy + _size.height / 2);
    Product existed = allShoppingCarts.firstWhere((p) => p.id == widget.data.id,
        orElse: () => null);

    if (existed == null) {
      allShoppingCarts.add(widget.data);
    } else {
      existed.count++;
    }

    if (widget.animateCart) {
      System.move(_next);
    } else {
      Fluttertoast.showToast(
          msg: "Added to shopping cart",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: AppColor.foreground,
          textColor: AppColor.label,
          fontSize: 16.0);
    }

    _counterBloc.add(IncrementEvent());
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      key: _buttonKey,
      color: AppColor.primaryDart,
      textColor: AppColor.main,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          side: BorderSide(color: AppColor.primaryDart)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("ADD", style: Style.buttonCart(widget.size)),
          Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(Icons.add_shopping_cart, size: widget.size))
        ],
      ),
      onPressed: () => handleClick(context),
    );
  }
}
