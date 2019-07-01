import 'package:flutter/material.dart';

import 'screens/Search/main.dart';
import 'screens/profile.dart';

import 'screens/Home/main.dart';
import 'screens/ProductCategory/main.dart';
import 'screens/ProductDetail/main.dart';
import 'screens/ShoppingCart/main.dart';
import 'screens/ItemCategory/main.dart';

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
        '/': (context) => new Mainpage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/product-detail': (context) => new ProductDetail(),
        '/woman-category': (context) => new ItemCategory(),
        '/man-category': (context) => new ItemCategory(),
        '/sport-category': (context) => new ItemCategory(),
      },
    ),
  );
}

class Mainpage extends StatelessWidget {
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
        return HomePage();
      case 1:
        return ProductCategory();
      case 2:
        return Search();
      case 3:
        return ShoppingCart();
      case 4:
        return Profile();
      default:
        return HomePage();
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
