import 'package:ChStore/model/Topic.dart';

class Category extends Topic {
  Category({
    final int id,
    final String image,
    final String name,
  }) : super(
          id: id,
          image: image,
          name: name,
        );
}

// List<Category> allCategories = <Category>[
//   Category(id: 0, name: "Sport", image: "lib/picture/category/sports.jpg"),
//   Category(id: 1, name: "Travel", image: "lib/picture/category/travel.jpg"),
//   Category(id: 2, name: "Music", image: "lib/picture/category/music.jpg"),
//   Category(id: 3, name: "Gaming", image: "lib/picture/category/gaming.jpg"),
//   Category(
//       id: 4, name: "Photo", image: "lib/picture/category/photography.jpg"),
//   Category(id: 5, name: "Food", image: "lib/picture/category/food.jpg"),
// ];
