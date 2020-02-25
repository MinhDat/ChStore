import 'package:ChStore/bloc/main.dart';
import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BLoCRenderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        if (state is DataError) {
          return Center(child: Text('failed to fetch data'));
        }
        if (state is DataUninitialized) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is DataLoaded) {
          if (state.products.isEmpty ||
              state.categories.isEmpty ||
              state.topics.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: CircularProgressIndicator(),
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CardWrapper(
                child: Column(children: [
                  FourCircleItem(state.types.getRange(0, 4).toList()),
                  FourCircleItem(state.types.getRange(4, 8).toList()),
                ]),
              ),
              CardWrapper(
                label: Text("Today", style: ChTextStyle.title),
                child: ChCardPage(state.products.getRange(14, 20).toList()),
              ),
              CardWrapper(
                label: Text("News", style: ChTextStyle.title),
                child: ChCardSlider(state.products.getRange(7, 14).toList()),
              ),
              CardWrapper(
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("All products", style: ChTextStyle.title),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/product-list'),
                      child: Text("See All", style: ChTextStyle.link),
                    ),
                  ],
                ),
                child: ItemList(
                    products: state.products.getRange(0, 7).toList(),
                    animateCart: true),
              ),
              CardWrapper(
                  label: Text("Hashtags", style: ChTextStyle.title),
                  child: PopularCategories()),
              CardWrapper(
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top trends", style: ChTextStyle.title),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/product-list'),
                      child: Text("See All", style: ChTextStyle.link),
                    ),
                  ],
                ),
                child: SmallChCardList(
                  context,
                  dataList: state.products.getRange(14, 20).toList(),
                ),
              ),
              CardWrapper(
                label: Text("Populations", style: ChTextStyle.title),
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: PopularTags(),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
