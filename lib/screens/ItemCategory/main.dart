import 'package:flutter/material.dart';
import '../../widgets/ItemCardListView.dart';
import '../../data/category.dart';

class ItemCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    Category category = settings.arguments;
    return ItemCategoryContainer(category);
  }
}

class ItemCategoryContainer extends StatefulWidget {
  ItemCategoryContainer(this.category);
  final Category category;

  @override
  State<StatefulWidget> createState() {
    return _WidgetList(category);
  }
}

class _WidgetList extends State<ItemCategoryContainer> {
  _WidgetList(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${category.name} categories"),
      ),
      body: ItemCardListView(context),
    );
  }
}
