import 'package:ChStore/bloc/Bloc.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/utils/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:ChStore/model/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    Topic _topic = settings.arguments as Topic;

    return Scaffold(
      appBar: AppBar(
        title: Text("${_topic.name}", style: AppTextStyle.normal),
      ),
      body: BlocBuilder<DataBloc, DataState>(builder: (context, state) {
        if (state is DataError) {
          return Center(
            child: Text('failed to fetch data'),
          );
        }
        if (state is DataLoaded) {
          if (state.products.isEmpty) {
            return Center(
              child: Text("No items", style: AppTextStyle.noItem),
            );
          }
          List dataList = state.products
              .where((item) => (item.categoryId == _topic.id))
              .toList();

          return ListView(
              children: [SmallChCardList(context, dataList: dataList)]);
        }
      }),
    );
  }
}
