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

  Product product(_id, _categoryId) {
    int randomId = _factory.faker.randomGenerator.integer(1000);
    return Product(
      id: _id,
      categoryId: _factory.faker.randomGenerator.integer(11),
      name: _factory.faker.conference.name(),
      producer: _factory.faker.company.name(),
      origin: _factory.faker.company.suffix(),
      productionDate: DateTime.now(),
      thumbnail: "https://i.picsum.photos/id/${randomId}/375/375.jpg",
      image: "https://i.picsum.photos/id/${randomId}/375/812.jpg",
      price: num.parse(_factory.faker.randomGenerator
          .decimal(scale: 100, min: 1)
          .toStringAsFixed(2)),
      description: _factory.faker.lorem.words(100).join(" "),
    );
  }
}
