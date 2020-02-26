import 'package:ChStore/bloc/main.dart';
import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(builder: (context, state) {
      if (state is DataError) {
        return Center(child: Text('failed to fetch data'));
      }
      if (state is DataLoaded) {
        if (state.categories.isEmpty) {
          return Center(child: Text("No items", style: Style.noItem));
        }
        return TwoCardList(context,
            type: CATEGORIES_TYPE, dataList: state.categories);
      }
    });
  }
}
