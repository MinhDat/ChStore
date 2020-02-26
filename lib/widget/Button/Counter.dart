import 'package:ChStore/bloc/main.dart';
import 'package:ChStore/utility/System.dart';
import 'package:ChStore/utility/main.dart';
import 'package:ChStore/model/Product.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Constants

const DECREMENT = 0;
const INCREMENT = 1;

class Counter extends StatefulWidget {
  Counter(this.id);
  final int id;

  @override
  CounterState createState() => new CounterState();
}

class CounterState extends State<Counter> {
  TextField countNumber;
  TextEditingController _textEditingController;
  double counterRadius = System.media.size.width / 50;
  double counterRadiusInner = System.media.size.width / 100;
  double counterSize = System.media.size.width / 10;
  double counterSizeInner = System.media.size.width / 12;

  @override
  void initState() {
    super.initState();
    Product productItem =
        allShoppingCarts.firstWhere((a) => a.id == widget.id, orElse: null);
    _textEditingController = TextEditingController(
        text: productItem != null ? productItem.count.toString() : "1");
    countNumber = TextField(
      controller: _textEditingController,
      textAlign: TextAlign.center,
      style: Style.counter,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.main,
        contentPadding: const EdgeInsets.all(5),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.main),
          borderRadius: BorderRadius.circular(counterRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.main),
          borderRadius: BorderRadius.circular(counterRadius),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void handleChange(type, CounterBloc counterBloc) {
    Product productItem = allShoppingCarts.firstWhere((a) => a.id == widget.id);
    if (type == DECREMENT && allShoppingCarts[widget.id].count > 1) {
      counterBloc.add(DecrementEvent());
      productItem.count--;
    }
    if (type == INCREMENT) {
      counterBloc.add(IncrementEvent());
      productItem.count++;
    }
    _textEditingController.text = allShoppingCarts[widget.id].count.toString();
  }

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => handleChange(DECREMENT, counterBloc),
          child: Container(
            height: counterSize,
            width: counterSize,
            decoration: BoxDecoration(
              color: AppColor.primaryDart,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(counterRadius),
                bottomLeft: Radius.circular(counterRadius),
              ),
            ),
            child: Icon(
              Icons.remove,
              size: 20.0,
              color: AppColor.main,
            ),
          ),
        ),
        Container(
          height: counterSize,
          width: counterSizeInner,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  color: AppColor.primaryDart, width: counterRadiusInner),
              bottom: BorderSide(
                  color: AppColor.primaryDart, width: counterRadiusInner),
            ),
            color: AppColor.primaryDart,
          ),
          child: countNumber,
        ),
        InkWell(
          onTap: () => handleChange(INCREMENT, counterBloc),
          child: Container(
            height: counterSize,
            width: counterSize,
            decoration: BoxDecoration(
              color: AppColor.primaryDart,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(counterRadius),
                bottomRight: Radius.circular(counterRadius),
              ),
            ),
            child: Icon(
              Icons.add,
              size: 20.0,
              color: AppColor.main,
            ),
          ),
        ),
      ],
    );
  }
}
