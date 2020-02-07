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
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                decoration: new BoxDecoration(
                  color: AppColor.white,
                  borderRadius: new BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(children: [
                  FourCircleItem(state.types.getRange(0, 4).toList()),
                  FourCircleItem(state.types.getRange(4, 8).toList()),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text("Today", style: AppTextStyle.title),
              ),
              ChCardPage(state.products.getRange(14, 20).toList()),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                child: Text("News", style: AppTextStyle.title),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ChCardSlider(state.products.getRange(7, 14).toList()),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                width: System.screenSize.width,
                color: AppColor.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("All products", style: AppTextStyle.title),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/product-list'),
                      child: Text("See All", style: AppTextStyle.buttonLink),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                color: AppColor.white,
                child:
                    ItemList(products: state.products.getRange(0, 7).toList()),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                width: System.screenSize.width,
                color: AppColor.white,
                child: Text("Hashtags", style: AppTextStyle.title),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                color: AppColor.white,
                child: PopularCategories(),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                width: System.screenSize.width,
                color: AppColor.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top trends", style: AppTextStyle.title),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/product-list'),
                      child: Text("See All", style: AppTextStyle.buttonLink),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                color: AppColor.white,
                child: SmallChCardList(
                  context,
                  dataList: state.products.getRange(14, 20).toList(),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                width: System.screenSize.width,
                color: AppColor.white,
                child: Text("Populations", style: AppTextStyle.title),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                color: AppColor.white,
                child: PopularTags(),
              ),
            ],
          );
        }
      },
    );
  }
}
