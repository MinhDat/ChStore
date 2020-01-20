import 'package:ChStore/utils/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ChStore/bloc/Bloc.dart';

class ProductList extends StatefulWidget {
  @override
  ProductListState createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  ProductBloc _productBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _productBloc = BlocProvider.of<ProductBloc>(context);
  }

  @override
  void dispose() {
    // _productBloc.add(Reset());
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List", style: AppTextStyle.normal),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductError) {
            return Center(
              child: Text('failed to fetch products'),
            );
          }
          if (state is ProductLoaded) {
            if (state.products.isEmpty) {
              return Center(
                child: Text('no products'),
              );
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.products.length
                    ? BottomLoader()
                    : ProductItem(item: state.products[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.products.length
                  : state.products.length + 1,
              controller: _scrollController,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
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
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
