import 'package:demo/screens/detail/main.dart';
import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
// import 'package:flutter/rendering.dart';

import 'screens/home/main.dart';
import 'screens/category/main.dart';
import 'screens/search.dart';
import 'screens/shoppingCart/main.dart';
import 'screens/profile.dart';
import 'screens/card/main.dart';

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
        '/': (context) => new Homepage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/product-detail': (context) => new ProductDetail(),
        '/women-category': (context) => new CardView(),
        '/men-category': (context) => new CardView(),
        '/sports-category': (context) => new CardView(),
      },
    ),
  );
}

class Homepage extends StatelessWidget {
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
        return Home(context);
      case 1:
        return Category(context);
      case 2:
        return Search();
      case 3:
        return ShoppingCart();
      case 4:
        return Profile();
      default:
        return Home(context);
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
