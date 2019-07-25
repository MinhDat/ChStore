import 'package:flutter/material.dart';
import 'package:ChStore/utils/MixColor.dart';

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
        // Category route
        '/woman-category': (context) => new ItemCategory(),
        '/man-category': (context) => new ItemCategory(),
        '/sport-category': (context) => new ItemCategory(),
        '/animal-category': (context) => new ItemCategory(),
        '/life-category': (context) => new ItemCategory(),
        '/book-category': (context) => new ItemCategory(),
        '/travel-category': (context) => new ItemCategory(),
        '/child-category': (context) => new ItemCategory(),
      },
    ),
  );
}

class Mainpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<Mainpage> {
  int index = 0;

  Widget _navigateToScreen(int index) {
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
              'icons/today-icon.png',
              height: 22,
              width: 22,
              color: index == 0 ? mixColor.mainColor : Colors.black54,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset(
              'icons/toggle-menu-icon.png',
              height: 22,
              width: 22,
              color: index == 1 ? mixColor.mainColor : Colors.black54,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset(
              'icons/search-icon.png',
              height: 22,
              width: 22,
              color: index == 2 ? mixColor.mainColor : Colors.black54,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: index == 3 ? mixColor.mainColor : Colors.black54,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: index == 4 ? mixColor.mainColor : Colors.black54,
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
