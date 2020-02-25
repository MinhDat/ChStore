import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';

import 'Discovery/main.dart';
import 'HomePage/main.dart';
import 'Notice/main.dart';
import 'Personality/main.dart';
import 'Search/main.dart';

class Mainpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _index = 0;

  @override
  build(BuildContext context) {
    return AnimateSC(
      child: Scaffold(
        body: _navigateToScreen(_index),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (int index) => setState(() => _index = index),
          items: [
            BottomNavigationBarItem(
              icon: new Image.asset('icon/today-icon.png',
                  height: 22,
                  width: 22,
                  color: _index == 0 ? ChColor.primary : ChColor.unfocus),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: new Image.asset('icon/toggle-menu-icon.png',
                  height: 22,
                  width: 22,
                  color: _index == 1 ? ChColor.primary : ChColor.unfocus),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: new Image.asset('icon/search-icon.png',
                  height: 22,
                  width: 22,
                  color: _index == 2 ? ChColor.primary : ChColor.unfocus),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications,
                  color: _index == 3 ? ChColor.primary : ChColor.unfocus),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: _index == 4 ? ChColor.primary : ChColor.unfocus),
              title: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigateToScreen(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return Discovery();
      case 2:
        return Search();
      case 3:
        return Notice();
      case 4:
        return Personality();
      default:
        return HomePage();
    }
  }
}
