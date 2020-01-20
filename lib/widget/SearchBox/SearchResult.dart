import 'dart:async';

import 'package:ChStore/bloc/Bloc.dart';
import 'package:ChStore/provider/Provider.dart';
import 'package:ChStore/utils/main.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/Item/ItemList.dart';
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
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: showResult
          ? ListView(children: [
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
                if (state is ProductError) {
                  return Center(
                    child: Text('failed to fetch products'),
                  );
                }
                if (state is ProductLoaded) {
                  if (state.products.isEmpty) {
                    return Center(
                      child: Text("No items", style: AppTextStyle.noItem),
                    );
                  }
                  return ItemList(
                    products: state.products,
                  );
                }
              })
            ])
          : Align(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(),
            ),
    );
  }
}
