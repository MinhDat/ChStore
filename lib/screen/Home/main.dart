import 'package:ChStore/bloc/Bloc.dart';
import 'package:ChStore/model/main.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/widget/main.dart';
import 'package:ChStore/utils/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Header(),
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 10),
          child: Text("Today", style: AppTextStyle.title),
        ),
        ChCardPage(),
        FourCircleItem(),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
          child: Text("News", style: AppTextStyle.title),
        ),
        ChCardSlider(),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
          child: Stack(
            children: [
              Text("Top trends", style: AppTextStyle.title),
              Positioned(
                right: 20,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/product-list');
                  },
                  child: Text("See All", style: AppTextStyle.buttonLink),
                ),
              )
            ],
          ),
        ),
        ItemListBloc()
      ],
    );
  }
}

class ItemListBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
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
            maxItem: MAXIMUM_ITEM,
          );
        }
      },
    );
  }
}
