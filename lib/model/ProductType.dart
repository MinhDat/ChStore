import 'package:equatable/equatable.dart';

class ProductType extends Equatable {
  ProductType({
    this.id,
    this.image,
    this.name,
  });
  final int id;
  final String image;
  final String name;

  @override
  List<Object> get props => [
        id,
        image,
        name,
      ];
}