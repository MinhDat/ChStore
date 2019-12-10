import 'package:flutter/material.dart';

import 'package:ChStore/data/Topic.dart';
import 'package:ChStore/utils/AppColor.dart';

//Template Type
const NORMAL_LIST_TYPE = 1;

class Topic extends StatelessWidget {
  Topic(this._parentContext, {this.type: NORMAL_LIST_TYPE});
  final BuildContext _parentContext;
  final int type;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    List<GestureDetector> _categories = allTopics
        .asMap()
        .map((index, category) {
          AlignmentGeometry _alignment = Alignment.centerRight;

          if (index % 2 > 0) {
            _alignment = Alignment.centerLeft;
          }
          return MapEntry(
            index,
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  _parentContext,
                  '/${category.name.toLowerCase()}-topic',
                  arguments: category,
                );
              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    height: 130,
                    width: screenSize.width,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: appColor.black38,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: category.image != null
                          ? Image.asset(
                              category.image,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              color: appColor.white,
                            ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    bottom: 0,
                    child: Container(
                      height: 130,
                      width: screenSize.width,
                      alignment: _alignment,
                      padding: EdgeInsets.only(right: 20.0, left: 20.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.0, left: 20.0),
                        child: Text(
                          category.name,
                          style: TextStyle(
                            fontSize: 33.0,
                            fontWeight: FontWeight.bold,
                            color: appColor.main,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        })
        .values
        .toList();

    return Column(
      children: _categories,
    );
  }
}
