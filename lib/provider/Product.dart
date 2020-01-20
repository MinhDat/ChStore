import 'package:ChStore/bloc/Bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FetchProduct extends StatelessWidget {
  FetchProduct(this._child);
  final Widget _child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(Fetch()),
      child: _child,
    );
  }
}
