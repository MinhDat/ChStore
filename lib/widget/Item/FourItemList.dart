import 'package:flutter/material.dart';

class FourItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double itemWidth = (screenSize.width - 40) / 4;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: (itemWidth - 10) / 2,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                ),
                Text("Sport")
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: (itemWidth - 10) / 2,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                ),
                Text("Sport")
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: (itemWidth - 10) / 2,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                ),
                Text("Sport")
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: (itemWidth - 10) / 2,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                ),
                Text("Sport")
              ],
            ),
          )
        ],
      ),
    );
  }
}
