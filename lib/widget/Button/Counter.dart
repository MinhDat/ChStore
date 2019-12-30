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
  int count;
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
    _textEditingController =
        TextEditingController(text: widget.count.toString());
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
    if (type == DECREMENT && widget.count > 1) {
      System.countDown(1);
      widget.count--;
    }
    if (type == INCREMENT) {
      System.countUp(1);
      widget.count++;
    }
    if (widget.id != null) {
      allProducts[widget.id].count = widget.count;
    }
    _textEditingController.text = widget.count.toString();
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
