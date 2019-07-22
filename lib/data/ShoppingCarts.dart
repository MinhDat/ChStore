import 'package:ChStore/data/Product.dart';

class ShoppingCarts extends Product {
  ShoppingCarts({
    final int id,
    final String image,
    final String name,
    final String price,
    final String description,
    bool favorited,
    int count,
    final int categoryId,
  }) : super();
}

List<ShoppingCarts> allShoppingCarts = <ShoppingCarts>[
  ShoppingCarts(
    id: 0,
    image: "lib/pictures/picture_one.webp",
    name: "Product Demo One JDK MAX NICE 87320",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  )
];
