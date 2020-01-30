import 'package:flutter/material.dart';

import 'package:ChStore/bloc/Bloc.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FetchProduct extends StatelessWidget {
  FetchProduct(this._child);
  final Widget _child;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return BlocProvider(
      create: (context) => DataBloc()..add(Fetch()),
      child: _child,
    );
  }
}
