import 'package:flutter/material.dart';

import 'package:ChStore/data/Category.dart';

//Template Type
const NORMAL_LIST_TYPE = 1;

class CategoryListView extends StatelessWidget {
  CategoryListView(this._parentContext, {this.type: NORMAL_LIST_TYPE});
  final BuildContext _parentContext;
  final int type;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    List<GestureDetector> _categories = allCategories
        .asMap()
        .map((index, category) {
          List<Color> _colors = [
            Colors.white,
            Colors.black,
          ];
          AlignmentGeometry _alignment = Alignment.centerRight;

          if (index % 2 > 0) {
            _colors = [
              Colors.black,
              Colors.white,
            ];
            _alignment = Alignment.centerLeft;
          }
          return MapEntry(
            index,
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  _parentContext,
                  '/${category.name.toLowerCase()}-category',
                  arguments: category,
                );
              },
              child: Stack(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    height: 130,
                    width: screenSize.width,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0.0, 3.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Image.asset(
                        category.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    bottom: 0,
                    child: Opacity(
                      opacity: 0.25,
                      child: Container(
                        height: 130,
                        width: screenSize.width - 20,
                        alignment: _alignment,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                          gradient: LinearGradient(
                            colors: _colors,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.0, left: 20.0),
                          child: Text(
                            category.name,
                            style: TextStyle(
                              fontSize: 33.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
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
