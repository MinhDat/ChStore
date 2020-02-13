import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Name', style: TextStyle(color: ChColor.content_v1)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RatingBar(
              initialRating: 4,
              itemSize: System.screenSize.width / 30,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(
                  horizontal: System.screenSize.width / 300),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              ignoreGestures: true,
              onRatingUpdate: (double value) {},
            ),
            Text("05/02/2020", style: TextStyle(color: ChColor.content_v1)),
          ],
        ),
        Text("very good", style: TextStyle(color: ChColor.content_v1))
      ],
    );
  }
}
