import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:ChStore/bloc/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  DataBloc _productBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _productBloc = BlocProvider.of<DataBloc>(context);
  }

  @override
  void dispose() {
    // _productBloc.add(Reset());
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimateSC(
      secondScreen: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          title: Text("Product List", style: Style.header),
          actions: <Widget>[ShowCart(secondScreen: true)],
        ),
        body: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is DataError) {
              return Center(child: Text('failed to fetch data'));
            }
            if (state is DataLoaded) {
              if (state.products.isEmpty) {
                return Center(child: Text('no items'));
              }
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.products.length
                        ? BottomLoader()
                        : ProductItem(
                            item: state.products[index], animateCart: true);
                  },
                  itemCount: state.hasReachedMax
                      ? state.products.length
                      : state.products.length + 1,
                  controller: _scrollController,
                ),
              );
            }
            return Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _productBloc.add(Fetch());
    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: CircularProgressIndicator()),
      ),
    );
  }
}
