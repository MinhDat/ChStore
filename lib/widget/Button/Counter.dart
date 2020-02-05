import 'package:ChStore/utils/System.dart';
import 'package:ChStore/utils/main.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/model/Product.dart';

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
  double counterRadius = System.screenSize.width / 50;
  double counterRadiusInner = System.screenSize.width / 100;
  double counterSize = System.screenSize.width / 10;
  double counterSizeInner = System.screenSize.width / 12;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(
        text: allShoppingCarts[widget.id].count.toString());
    countNumber = TextField(
      controller: _textEditingController,
      textAlign: TextAlign.center,
      style: AppTextStyle.cardCounter,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.white,
        contentPadding: const EdgeInsets.all(5),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.white),
          borderRadius: BorderRadius.circular(counterRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.white),
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

  void handleChange(type) {
    if (type == DECREMENT && allShoppingCarts[widget.id].count > 1) {
      System.countDown(1);
      allShoppingCarts[widget.id].count--;
      // widget.count--;
    }
    if (type == INCREMENT) {
      System.countUp(1);
      allShoppingCarts[widget.id].count++;
      // widget.count++;
    }
    _textEditingController.text = allShoppingCarts[widget.id].count.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            handleChange(DECREMENT);
          },
          child: Container(
            height: counterSize,
            width: counterSize,
            decoration: BoxDecoration(
              color: AppColor.redAccent100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(counterRadius),
                bottomLeft: Radius.circular(counterRadius),
              ),
            ),
            child: Icon(
              Icons.remove,
              size: 20.0,
              color: AppColor.white,
            ),
          ),
        ),
        Container(
          height: counterSize,
          width: counterSizeInner,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  color: AppColor.redAccent100, width: counterRadiusInner),
              bottom: BorderSide(
                  color: AppColor.redAccent100, width: counterRadiusInner),
            ),
            color: AppColor.redAccent100,
          ),
          child: countNumber,
        ),
        InkWell(
          onTap: () {
            handleChange(INCREMENT);
          },
          child: Container(
            height: counterSize,
            width: counterSize,
            decoration: BoxDecoration(
              color: AppColor.redAccent100,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(counterRadius),
                bottomRight: Radius.circular(counterRadius),
              ),
            ),
            child: Icon(
              Icons.add,
              size: 20.0,
              color: AppColor.white,
            ),
          ),
        ),
      ],
    );
  }
}
