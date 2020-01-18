import 'package:ChStore/api/Factory.dart';
import 'package:ChStore/model/Product.dart';

class ChApi {
  Future<List<Product>> getProducts(
      int startIndex, int limit, int _categoryId) async {
    // await Future.delayed(Duration(seconds: 3));
    DataGenerator gen = DataGenerator();
    List<Product> _products = [];
    for (int i = startIndex; i < startIndex + limit; i++) {
      _products.add(gen.product(i, _categoryId));
    }

    return _products;
  }
}

ChApi api = ChApi();
