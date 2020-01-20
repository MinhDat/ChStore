import 'package:flutter/material.dart';
import 'package:ChStore/widget/main.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SmallChCardList(
      context,
      type: CATEGORIES_TYPE,
    );
  }
}
