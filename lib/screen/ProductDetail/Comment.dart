import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Name', style: TextStyle(color: AppColor.content)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RatingBar(
              initialRating: 4,
              itemSize: System.media.size.width / 30,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(
                  horizontal: System.media.size.width / 300),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: AppColor.activateStar,
              ),
              ignoreGestures: true,
              onRatingUpdate: (double value) {},
            ),
            Text("05/02/2020", style: TextStyle(color: AppColor.content)),
          ],
        ),
        Text("very good", style: TextStyle(color: AppColor.content))
      ],
    );
  }
}
