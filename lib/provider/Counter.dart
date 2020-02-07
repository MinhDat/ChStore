import 'package:flutter/material.dart';
import 'package:ChStore/bloc/Bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  Counter(this._child);
  final Widget _child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: _child,
    );
  }
}