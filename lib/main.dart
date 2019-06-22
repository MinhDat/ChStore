import 'package:demo/screens/detail/main.dart';
import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
// import 'package:flutter/rendering.dart';

import 'screens/home/main.dart';
import 'screens/category.dart';
import 'screens/search.dart';
import 'screens/shopping-cart.dart';
import 'screens/profile.dart';

import 'data/product.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(primaryColor: Colors.white),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => new MyApp(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/product-detail': (context) => new ProductDetail(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<BottomNavigation> {
  int index = 0;

  _navigateToScreen(int index) {
    switch (index) {
      case 0:
        return Home(context, allProducts);
      case 1:
        return Category();
      case 2:
        return Search();
      case 3:
        return ShoppingCart();
      case 4:
        return Profile();
      default:
        return Home(context, allProducts);
    }
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      body: _navigateToScreen(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: new Image.asset(
              'images/today-icon.png',
              height: 22,
              width: 22,
              color: index == 0 ? Colors.blue : Colors.black54,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset(
              'images/toggle-menu-icon.png',
              height: 22,
              width: 22,
              color: index == 1 ? Colors.blue : Colors.black54,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset(
              'images/search-icon.png',
              height: 22,
              width: 22,
              color: index == 2 ? Colors.blue : Colors.black54,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: index == 3 ? Colors.blue : Colors.black54,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: index == 4 ? Colors.blue : Colors.black54,
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

List<Product> allProducts = [
  Product(
    image: "lib/assets/picture_one.webp",
    name: "Product demo 1",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    image: "lib/assets/picture_two.webp",
    name: "Product demo 2",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    image: "lib/assets/picture_three.webp",
    name: "Product demo 3",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    image: "lib/assets/picture_four.webp",
    name: "Product demo 4",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    image: "lib/assets/picture_five.webp",
    name: "Product demo 5",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    image: "lib/assets/picture_six.jpg",
    name: "Product demo 6",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  )
];
