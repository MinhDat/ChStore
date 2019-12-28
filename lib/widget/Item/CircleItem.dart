import 'package:flutter/material.dart';
import 'package:ChStore/utils/AppTextStyle.dart';

class CircleItem extends StatelessWidget {
  CircleItem({this.itemWidth: 10, this.title: ""});
  final double itemWidth;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            radius: (itemWidth - 10) / 2,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
        ),
        Text(title, style: AppTextStyle.normal)
      ],
    );
  }
}
