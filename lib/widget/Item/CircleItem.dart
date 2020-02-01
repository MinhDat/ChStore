import 'package:flutter/material.dart';
import 'package:ChStore/utils/AppTextStyle.dart';

class CircleItem extends StatelessWidget {
  CircleItem({this.itemWidth: 10, this.title: "", this.image});
  final double itemWidth;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            radius: (itemWidth - 20) / 2,
            backgroundImage: image.isEmpty
                ? NetworkImage('https://via.placeholder.com/150')
                : AssetImage(image),
          ),
        ),
        Text(title, style: AppTextStyle.normal)
      ],
    );
  }
}
