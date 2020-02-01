import 'package:ChStore/bloc/Bloc.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/widget/main.dart';
import 'package:ChStore/utils/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Header(), RenderBlocBuilder()],
    );
  }
}

class RenderBlocBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        if (state is DataError) {
          return Center(
            child: Text('failed to fetch data'),
          );
        }
        if (state is DataUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DataLoaded) {
          if (state.products.isEmpty ||
              state.categories.isEmpty ||
              state.topics.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text("Today", style: AppTextStyle.title),
              ),
              ChCardPage(state.products.getRange(14, 20).toList()),
              FourCircleItem(state.types.getRange(0, 4).toList()),
              FourCircleItem(state.types.getRange(4, 8).toList()),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                child: Text("News", style: AppTextStyle.title),
              ),
              ChCardSlider(state.products.getRange(7, 14).toList()),
              Container(
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                width: System.screenSize.width,
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
              ItemList(products: state.products.getRange(0, 7).toList())
            ],
          );
        }
      },
    );
  }
}
