import 'package:flutter/material.dart';

class SearchBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchBarContainer();
  }
}

class SearchBarContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchBarState();
  }
}

class SearchBarState extends State<SearchBarContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          prefixIcon: new Icon(Icons.search),
          suffixIcon: new Icon(Icons.close),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 14.0, top: 14.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: 'Enter a search term',
        ),
      ),
    );
  }
}
