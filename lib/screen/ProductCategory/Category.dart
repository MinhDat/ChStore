import 'package:flutter/material.dart';
import 'package:ChStore/widget/Card/SmallChCardList.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SmallChCardList(
      context,
      type: CATEGORIES_TYPE,
    );
  }
}
