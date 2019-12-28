import 'package:ChStore/utils/System.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/data/Product.dart';

// Constants
const RADIUS = 10.0;

const DECREMENT = 0;
const INCREMENT = 1;

class Counter extends StatefulWidget {
  Counter({this.count: 0, this.id});
  final int count;
  final int id;

  @override
  CounterState createState() =>
      new CounterState(count: this.count, id: this.id);
}

class CounterState extends State<Counter> {
  CounterState({this.count, this.id});
  int count;
  final int id;

  TextField countNumber;
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: count.toString());
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
          borderRadius: BorderRadius.circular(RADIUS),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.white),
          borderRadius: BorderRadius.circular(RADIUS),
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
    if (type == DECREMENT && count > 1) {
      System.countDown(1);
      count--;
    }
    if (type == INCREMENT) {
      System.countUp(1);
      count++;
    }
    if (id != null) {
      allProducts[id].count = count;
    }
    _textEditingController.text = count.toString();
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
                topLeft: Radius.circular(RADIUS),
                bottomLeft: Radius.circular(RADIUS),
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
                topRight: Radius.circular(RADIUS),
                bottomRight: Radius.circular(RADIUS),
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
