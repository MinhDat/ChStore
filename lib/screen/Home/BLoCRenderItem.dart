import 'package:ChStore/bloc/Bloc.dart';
import 'package:ChStore/model/main.dart';
import 'package:ChStore/utils/main.dart';
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
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: new BoxDecoration(
                  color: ChColor.main,
                  borderRadius: new BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(children: [
                  FourCircleItem(state.types.getRange(0, 4).toList()),
                  FourCircleItem(state.types.getRange(4, 8).toList()),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text("Today", style: ChTextStyle.title),
              ),
              ChCardPage(state.products.getRange(14, 20).toList()),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                child: Text("News", style: ChTextStyle.title),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ChCardSlider(state.products.getRange(7, 14).toList()),
              ),
              LabelContainer(
                child: Row(
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
              ),
              ContentContainer(
                child:
                    ItemList(products: state.products.getRange(0, 7).toList()),
              ),
              LabelContainer(child: Text("Hashtags", style: ChTextStyle.title)),
              ContentContainer(child: PopularCategories()),
              LabelContainer(
                child: Row(
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
              ),
              ContentContainer(
                child: SmallChCardList(
                  context,
                  dataList: state.products.getRange(14, 20).toList(),
                ),
              ),
              LabelContainer(
                  child: Text("Populations", style: ChTextStyle.title)),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                color: ChColor.main,
                child: PopularTags(),
              ),
            ],
          );
        }
      },
    );
  }
}

class LabelContainer extends StatelessWidget {
  final Widget child;
  LabelContainer({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(20),
      width: System.screenSize.width,
      color: ChColor.main,
      child: child,
    );
  }
}

class ContentContainer extends StatelessWidget {
  final Widget child;
  ContentContainer({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      color: ChColor.main,
      child: child,
    );
  }
}
