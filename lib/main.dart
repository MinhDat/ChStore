import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

import 'views/home/main.dart';
import 'views/category.dart';
import 'views/search.dart';
import 'views/shopping-cart.dart';
import 'views/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(primaryColor: Colors.white),
      home: BottomNavigation(),
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
        return Home();
      case 1:
        return Category();
      case 2:
        return Search();
      case 3:
        return ShoppingCart();
      case 4:
        return Profile();
      default:
        return Home();
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
