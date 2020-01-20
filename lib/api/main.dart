import 'package:ChStore/api/Factory.dart';
import 'package:ChStore/model/Product.dart';
import 'package:ChStore/model/main.dart';

class ChApi {
  Future<List<Product>> getProducts(
      int startIndex, int limit, int _categoryId) async {
    DataGenerator gen = DataGenerator();
    List<Product> _products = [];
    for (int i = startIndex; i < startIndex + limit; i++) {
      _products.add(gen.product(i, _categoryId));
    }

    return _products;
  }

  Future<List<Category>> getCategories() async {
    return [
      Category(
          id: 0, name: "Sport", image: "lib/picture/categories/sports.jpg"),
      Category(
          id: 1, name: "Travel", image: "lib/picture/categories/travel.jpg"),
      Category(id: 2, name: "Music", image: "lib/picture/categories/music.jpg"),
      Category(
          id: 3, name: "Gaming", image: "lib/picture/categories/gaming.jpg"),
      Category(
          id: 4,
          name: "Photo",
          image: "lib/picture/categories/photography.jpg"),
      Category(id: 5, name: "Food", image: "lib/picture/categories/food.jpg"),
    ];
  }

  Future<List<Topic>> getTopics() async {
    return [
      Topic(
          id: 6, name: "Woman", image: "lib/picture/topics/woman-category.jpg"),
      Topic(id: 7, name: "Man", image: "lib/picture/topics/man-category.jpg"),
      Topic(
          id: 0, name: "Sport", image: "lib/picture/topics/sport-category.png"),
      Topic(id: 8, name: "Child"
          // image: "lib/picture/topics/sport-category.png",
          ),
      Topic(
        id: 9,
        // image: "lib/picture/topics/sport-category.png",
        name: "Animal",
      ),
      Topic(
        id: 10,
        // image: "lib/picture/topics/sport-category.png",
        name: "Life",
      ),
      Topic(
        id: 1,
        // image: "lib/picture/topics/sport-category.png",
        name: "Travel",
      ),
      Topic(
        id: 11,
        // image: "lib/picture/topics/sport-category.png",
        name: "Book",
      ),
    ];
  }
}

ChApi api = ChApi();
