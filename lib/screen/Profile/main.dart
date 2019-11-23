import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: screenSize.height / 3,
          width: screenSize.width,
          decoration: new BoxDecoration(
            color: Colors.pink,
            borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(20.0),
              bottomRight: const Radius.circular(20.0),
            ),
          ),
        )
      ],
    );
  }
}
