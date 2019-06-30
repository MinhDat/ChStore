import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../data/product.dart';

class ProductDetail extends StatelessWidget {
  Product product;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    product = settings.arguments;
    return ProductDetailContainer(product);
  }
}

class ProductDetailContainer extends StatefulWidget {
  ProductDetailContainer(this.product);
  final Product product;
  @override
  State<StatefulWidget> createState() {
    return _WidgetList(product);
  }
}

class _WidgetList extends State<ProductDetailContainer>
    with WidgetsBindingObserver {
  _WidgetList(this.product);
  Product product;
  Choice _selectedChoice;

  @override
  void initState() {
    super.initState();
    _selectedChoice = choices[0];
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    _selectedChoice = choice;
  }

  void _favoriteHandle() {
    setState(() {
      product.favorited = !product.favorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {},
          ),
          // action button
          IconButton(
            icon: Icon(Icons.favorite),
            color: product.favorited ? Colors.red : Colors.black,
            onPressed: () {
              _favoriteHandle();
            },
          ),
          // overflow menu
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.skip(2).map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                product.name,
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${product.price}",
                style: TextStyle(fontSize: 15),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  product.description,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
