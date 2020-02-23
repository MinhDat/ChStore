import 'dart:async';

import 'package:ChStore/bloc/main.dart';
import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResult extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SearchResultState();
}

class SearchResultState extends State<SearchResult> {
  Timer _timer;
  bool showResult = false;

  @override
  void initState() {
    super.initState();
    _timer = new Timer(const Duration(seconds: 1), () {
      setState(() {
        showResult = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null && _timer.isActive) _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: showResult
          ? Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: ChColor.border))),
              child:
                  BlocBuilder<DataBloc, DataState>(builder: (context, state) {
                if (state is DataError) {
                  return Center(child: Text('failed to fetch data'));
                }
                if (state is DataLoaded) {
                  if (state.products.isEmpty) {
                    return Center(
                        child: Text("No items", style: ChTextStyle.noItem));
                  }
                  return Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: ItemList(products: state.products));
                }
              }),
            )
          : Align(
              alignment: Alignment.topCenter, child: LinearProgressIndicator()),
    );
  }
}
