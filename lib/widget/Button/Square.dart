import 'package:ChStore/utils/main.dart';
import 'package:flutter/material.dart';

const RADIUS = 5.0;

class Square extends StatefulWidget {
  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: System.screenSize.width / 4,
      height: System.screenSize.width / 6,
      decoration: BoxDecoration(
        color: ChColor.main,
        borderRadius: BorderRadius.all(Radius.circular(RADIUS)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(RADIUS),
        child: Image.network("https://i.picsum.photos/id/99/375/375.jpg",
            fit: BoxFit.cover),
      ),
    );
  }
}
