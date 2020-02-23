import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Ratting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                "Rating",
                style: TextStyle(
                    color: ChColor.label,
                    fontSize: System.media.size.width / 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 8,
              child: RatingBar(
                initialRating: 0,
                itemSize: System.media.size.width / 10,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(
                    horizontal: System.media.size.width / 100),
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: ChColor.border,
              contentPadding: const EdgeInsets.only(
                  left: 14.0, right: 14.0, bottom: 5.0, top: 5.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ChColor.border),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ChColor.border),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Name',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: TextFormField(
            maxLines: 2,
            decoration: InputDecoration(
              filled: true,
              fillColor: ChColor.border,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ChColor.border),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ChColor.border),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Write something...',
            ),
          ),
        ),
        FlatButton(
          color: Colors.blue,
          onPressed: () {},
          child: Container(
            width: System.media.size.width,
            child: Text(
              "Send",
              textAlign: TextAlign.center,
              style: TextStyle(color: ChColor.label),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                "3.0",
                style: TextStyle(
                    color: ChColor.label,
                    fontWeight: FontWeight.bold,
                    fontSize: System.media.size.width / 10),
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBar(
                    initialRating: 1,
                    itemSize: System.media.size.width / 10,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: System.media.size.width / 100),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: true,
                    onRatingUpdate: (double value) {},
                  ),
                  RatingBar(
                    initialRating: 2,
                    itemSize: System.media.size.width / 10,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: System.media.size.width / 100),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: true,
                    onRatingUpdate: (double value) {},
                  ),
                  RatingBar(
                    initialRating: 3,
                    itemSize: System.media.size.width / 10,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: System.media.size.width / 100),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: true,
                    onRatingUpdate: (double value) {},
                  ),
                  RatingBar(
                    initialRating: 4,
                    itemSize: System.media.size.width / 10,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: System.media.size.width / 100),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: true,
                    onRatingUpdate: (double value) {},
                  ),
                  RatingBar(
                    initialRating: 5,
                    itemSize: System.media.size.width / 10,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: System.media.size.width / 100),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: true,
                    onRatingUpdate: (double value) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
