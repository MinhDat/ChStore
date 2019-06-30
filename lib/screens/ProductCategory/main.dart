import 'package:flutter/material.dart';
import '../../widgets/CategoryListView.dart';

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductCategoryContainer();
  }
}

class ProductCategoryContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<ProductCategoryContainer> {
  @override
  build(BuildContext context) {
    return CategoryListView(context);
  }
}
