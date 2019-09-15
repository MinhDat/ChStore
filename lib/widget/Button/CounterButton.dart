import 'package:flutter/material.dart';
import 'package:ChStore/utils/MixColor.dart';
import 'package:ChStore/data/Product.dart';

// Constants
const RADIUS = 10.0;

const DECREMENT = 0;
const INCREMENT = 1;

class CounterButton extends StatefulWidget {
  CounterButton({this.count: 0, this.id});
  final int count;
  final int id;

  @override
  CounterButtonState createState() =>
      new CounterButtonState(count: this.count, id: this.id);
}

class CounterButtonState extends State<CounterButton> {
  CounterButtonState({this.count, this.id});
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
      style: TextStyle(color: mixColor.counterButton),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(5),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(RADIUS),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
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
      count--;
    }
    if (type == INCREMENT) {
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
              color: mixColor.counterButton,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(RADIUS),
                bottomLeft: Radius.circular(RADIUS),
              ),
            ),
            child: Icon(
              Icons.remove,
              size: 25.0,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: 40,
          width: 35,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: mixColor.counterButton, width: 5.0),
              bottom: BorderSide(color: mixColor.counterButton, width: 5.0),
            ),
            color: mixColor.counterButton,
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
              color: mixColor.counterButton,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(RADIUS),
                bottomRight: Radius.circular(RADIUS),
              ),
            ),
            child: Icon(
              Icons.add,
              size: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
