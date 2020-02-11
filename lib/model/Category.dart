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
