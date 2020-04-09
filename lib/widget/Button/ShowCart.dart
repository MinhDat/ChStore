import 'package:ChStore/bloc/main.dart';
import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowCart extends StatelessWidget {
  ShowCart({this.secondScreen: false});
  final bool secondScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/shopping-cart'),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 7, right: 5),
            child: Icon(Icons.shopping_cart,
                key: this.secondScreen
                    ? System.keyShoppingCartSecond
                    : System.keyShoppingCart,
                size: 30),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: BlocBuilder<CounterBloc, int>(builder: (context, count) {
              return count > 0
                  ? Text("$count", style: Style.scCouter(AppColor.primary))
                  : SizedBox.shrink();
            }),
          ),
        ],
      ),
    );
  }
}