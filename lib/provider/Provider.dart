import 'package:ChStore/provider/Product.dart';
import 'package:flutter/material.dart';

class DataProvider extends StatelessWidget {
  DataProvider(this._child);
  final Widget _child;
  @override
  Widget build(BuildContext context) {
    return FetchProduct(_child);
  }
}