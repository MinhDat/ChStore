import 'package:equatable/equatable.dart';

class Product extends Equatable {
  Product({
    this.id,
    this.image,
    this.thumbnail,
    this.name,
    this.price,
    this.description,
    this.origin,
    this.producer,
    this.materials,
    this.favorited: false,
    this.count: 1,
    this.categoryId: 0,
    this.productionDate,
  });
  final int id;
  final String image;
  final String thumbnail;
  final String name;
  final double price;
  final String description;
  final String origin;
  final String producer;
  final String materials;
  bool favorited;
  int count;
  final int categoryId;
  final DateTime productionDate;

  @override
  List<Object> get props => [
        id,
        image,
        thumbnail,
        name,
        price,
        description,
        origin,
        producer,
        favorited,
        count,
        categoryId,
        productionDate
      ];
}

List<Product> allShoppingCarts = <Product>[];
