class Product {
  Product({
    this.image,
    this.name,
    this.price,
    this.description,
    this.favorited: false,
    this.count: 1,
  });
  final String image;
  final String name;
  final String price;
  final String description;
  bool favorited;
  int count;
}

List<Product> allProducts = [
  Product(
    image: "lib/assets/picture_one.webp",
    name: "Product demo 1",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    image: "lib/assets/picture_two.webp",
    name: "Product demo 2",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    image: "lib/assets/picture_three.webp",
    name: "Product demo 3",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    image: "lib/assets/picture_four.webp",
    name: "Product demo 4",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    image: "lib/assets/picture_five.webp",
    name: "Product demo 5",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    image: "lib/assets/picture_six.jpg",
    name: "Product demo 6",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  )
];
