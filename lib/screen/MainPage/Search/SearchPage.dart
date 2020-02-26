import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardWrapper(
          label: Text("Popular Categories", style: Style.title),
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: PopularCategories(),
          ),
        ),
        CardWrapper(
          label: Text("Populations", style: Style.title),
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: PopularTags(),
          ),
        )
      ],
    );
  }
}
