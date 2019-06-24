import 'package:flutter/cupertino.dart';

class Product {
  Product({
    this.image,
    this.name,
    this.price,
    this.description,
    this.favorited: false,
    this.count: 1,
  });
  final String image;
  final String name;
  final String price;
  final String description;
  bool favorited;
  int count;
}
