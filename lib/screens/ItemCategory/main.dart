import 'package:flutter/material.dart';
import 'package:ChStore/widgets/ItemCardListView.dart';
import 'package:ChStore/data/Category.dart';

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
