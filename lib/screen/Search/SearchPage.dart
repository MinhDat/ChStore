import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CardContainer(
          label: Text("Popular Categories", style: ChTextStyle.title),
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: PopularCategories(),
          ),
        ),
        CardContainer(
          label: Text("Populations", style: ChTextStyle.title),
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: PopularTags(),
          ),
        )
      ],
    );
  }
}

// CardContainer(
//                 label: Text("Populations", style: ChTextStyle.title),
//                 child: Container(
//                   padding: EdgeInsets.only(bottom: 10),
//                   child: PopularTags(),
//                 ),
//               )
