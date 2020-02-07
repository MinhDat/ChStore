import 'package:ChStore/provider/Counter.dart';
import 'package:ChStore/provider/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataProvider extends StatelessWidget {
  DataProvider(this._child);
  final Widget _child;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return FetchProduct(Counter(_child));
  }
}
