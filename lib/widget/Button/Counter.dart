import 'package:ChStore/utils/System.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/model/Product.dart';

// Constants
const COUNTER_RADIUS = 10.0;

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

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(
        text: allShoppingCarts[widget.id].count.toString());
    countNumber = TextField(
      controller: _textEditingController,
      textAlign: TextAlign.center,
      style: TextStyle(color: AppColor.redAccent100),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.white,
        contentPadding: const EdgeInsets.all(5),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.white),
          borderRadius: BorderRadius.circular(COUNTER_RADIUS),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.white),
          borderRadius: BorderRadius.circular(COUNTER_RADIUS),
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
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColor.redAccent100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(COUNTER_RADIUS),
                bottomLeft: Radius.circular(COUNTER_RADIUS),
              ),
            ),
            child: Icon(
              Icons.remove,
              size: 25.0,
              color: AppColor.white,
            ),
          ),
        ),
        Container(
          height: 40,
          width: 35,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColor.redAccent100, width: 5.0),
              bottom: BorderSide(color: AppColor.redAccent100, width: 5.0),
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
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColor.redAccent100,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(COUNTER_RADIUS),
                bottomRight: Radius.circular(COUNTER_RADIUS),
              ),
            ),
            child: Icon(
              Icons.add,
              size: 25.0,
              color: AppColor.white,
            ),
          ),
        ),
      ],
    );
  }
}
