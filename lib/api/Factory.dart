import 'package:ChStore/model/Product.dart';
import 'package:faker/faker.dart';

class Factory {
  Faker faker;
  static final Factory _factory = Factory._internal();

  factory Factory() {
    return _factory;
  }

  Factory._internal() {
    faker = new Faker();
  }
}

class DataGenerator {
  Factory _factory = new Factory();

  Product product(_id, _categoryId) => Product(
        id: _id,
        categoryId: _categoryId,
        name: _factory.faker.lorem.sentence(),
        producer: _factory.faker.lorem.sentence(),
        origin: _factory.faker.lorem.sentence(),
        productionDate: DateTime.now(),
        image: "https://picsum.photos/384",
        price: _factory.faker.randomGenerator.decimal(scale: 2, min: 1),
        description: _factory.faker.lorem.word(),
      );
}
