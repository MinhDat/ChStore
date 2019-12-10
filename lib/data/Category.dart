import 'package:ChStore/data/Topic.dart';

class Category {
  Category({
    this.id,
    this.image,
    this.name,
  });
  final int id;
  final String image;
  final String name;
}

List<Category> allCategories = <Category>[
  Category(id: 0, name: "Sports", image: "lib/picture/categories/sports.jpg"),
  Category(id: 1, name: "Travel", image: "lib/picture/categories/travel.jpg"),
  Category(id: 2, name: "Music", image: "lib/picture/categories/music.jpg"),
  Category(id: 3, name: "Gaming", image: "lib/picture/categories/gaming.jpg"),
  Category(
      id: 4, name: "Photo", image: "lib/picture/categories/photography.jpg"),
  Category(id: 5, name: "Food", image: "lib/picture/categories/food.jpg"),
];
