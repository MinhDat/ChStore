import 'package:ChStore/bloc/Bloc.dart';
import 'package:ChStore/utils/main.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(builder: (context, state) {
      if (state is DataError) {
        return Center(
          child: Text('failed to fetch data'),
        );
      }
      if (state is DataLoaded) {
        if (state.categories.isEmpty) {
          return Center(
            child: Text("No items", style: ChTextStyle.noItem),
          );
        }
        return SmallChCardList(context,
            type: CATEGORIES_TYPE, dataList: state.categories);
      }
    });
  }
}
