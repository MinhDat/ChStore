import 'package:ChStore/bloc/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataProvider extends StatelessWidget {
  DataProvider(this._child);
  final Widget _child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<DataBloc>(
          create: (context) => DataBloc()..add(Fetch()),
          lazy: true,
        )
      ],
      child: _child,
    );
  }
}
