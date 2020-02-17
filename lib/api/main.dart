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
          id: 0, name: "Sport", image: "lib/asset/image/category/sports.jpg"),
      Category(
          id: 1, name: "Travel", image: "lib/asset/image/category/travel.jpg"),
      Category(
          id: 2, name: "Music", image: "lib/asset/image/category/music.jpg"),
      Category(
          id: 3, name: "Gaming", image: "lib/asset/image/category/gaming.jpg"),
      Category(
          id: 4,
          name: "Photo",
          image: "lib/asset/image/category/photography.jpg"),
      Category(id: 5, name: "Food", image: "lib/asset/image/category/food.jpg"),
    ];
  }

  List<Topic> getTopics() {
    return [
      Topic(
          id: 6,
          name: "Woman",
          image: "lib/asset/image/topic/woman-category.jpg"),
      Topic(
          id: 7, name: "Man", image: "lib/asset/image/topic/man-category.jpg"),
      Topic(
          id: 0,
          name: "Sport",
          image: "lib/asset/image/topic/sport-category.png"),
      Topic(id: 8, name: "Child"
          // image: "lib/asset/image/topic//sport-category.png",
          ),
      Topic(
        id: 9,
        // image: "lib/asset/image/topic//sport-category.png",
        name: "Animal",
      ),
      Topic(
        id: 10,
        // image: "lib/asset/image/topic//sport-category.png",
        name: "Life",
      ),
      Topic(
        id: 1,
        // image: "lib/asset/image/topic//sport-category.png",
        name: "Travel",
      ),
      Topic(
        id: 11,
        // image: "lib/asset/image/topic//sport-category.png",
        name: "Book",
      ),
    ];
  }

  List<ProductType> getProductTypes() {
    return [
      ProductType(id: 0, name: "Pants", image: "icon/pant.png"),
      ProductType(id: 1, name: "Hats", image: "icon/hat.png"),
      ProductType(id: 2, name: "Bikinies", image: "icon/bikini.png"),
      ProductType(id: 3, name: "Ties", image: "icon/tie.png"),
      ProductType(id: 4, name: "Sweaters", image: "icon/sweater.png"),
      ProductType(id: 5, name: "T-shirts", image: "icon/t-shirt.png"),
      ProductType(id: 6, name: "Gloves", image: "icon/glove.png"),
      ProductType(id: 7, name: "Shoes", image: "icon/shoe.png"),
    ];
  }
}

ChApi api = ChApi();
