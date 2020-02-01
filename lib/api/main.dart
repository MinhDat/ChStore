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

  List<Category> getCategories() {
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

  List<Topic> getTopics() {
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

  List<ProductType> getProductTypes() {
    return [
      ProductType(id: 0, name: "Pants", image: "icons/pant.png"),
      ProductType(id: 1, name: "Hats", image: "icons/hat.png"),
      ProductType(id: 2, name: "Bikinies", image: "icons/bikini.png"),
      ProductType(id: 3, name: "Ties", image: "icons/tie.png"),
      ProductType(id: 4, name: "Sweaters", image: "icons/sweater.png"),
      ProductType(id: 5, name: "T-shirts", image: "icons/t-shirt.png"),
      ProductType(id: 6, name: "Gloves", image: "icons/glove.png"),
      ProductType(id: 7, name: "Shoes", image: "icons/shoe.png"),
    ];
  }
}

ChApi api = ChApi();
