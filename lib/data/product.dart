class Product {
  Product({
    this.id,
    this.image,
    this.name,
    this.price,
    this.description,
    this.favorited: false,
    this.count: 1,
    this.categoryId: 0,
  });
  final int id;
  final String image;
  final String name;
  final String price;
  final String description;
  bool favorited;
  int count;
  final int categoryId;
}

List<Product> allProducts = [
  Product(
    id: 0,
    image: "lib/assets/picture_one.webp",
    name: "Product Demo One JDK MAX NICE 87320",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    id: 1,
    image: "lib/assets/picture_two.webp",
    name: "Product Demo 2 MAVEN DATALOG 13412",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    id: 2,
    image: "lib/assets/picture_three.webp",
    name: "Product Demo Three Decentralize Application",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    id: 3,
    image: "lib/assets/picture_four.webp",
    name: "Product Demo 4 ZSU-1000",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    id: 4,
    image: "lib/assets/picture_five.webp",
    name: "Product Demo Five KAKA NATINA",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    id: 5,
    image: "lib/assets/picture_six.jpg",
    name: "Product demo 6 MINIMIZE CC 1000",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    id: 6,
    image: "lib/assets/picture_seven.webp",
    name: "Product Demo Seven Maxium H12000",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    id: 7,
    image: "lib/assets/picture_eight.webp",
    name: "Product Demo 8 Phantom and beauty",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    id: 8,
    image: "lib/assets/picture_nine.webp",
    name: "Product Demo Nine Malog Resize",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
  Product(
    id: 9,
    image: "lib/assets/picture_ten.jpg",
    name: "Product Demo 10 Fantasy Zero & One",
    price: "65.00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae hendrerit nisi. Curabitur eu sodales nibh. Cras posuere mauris vitae risus tincidunt fermentum. Nunc aliquet mauris quis urna tristique suscipit. Nulla feugiat imperdiet justo, vitae sollicitudin orci ultricies ut. Praesent id mauris euismod, auctor sem vitae, ultrices libero. Etiam vulputate, dui eget sollicitudin porttitor, nulla augue placerat mi, at porta quam ante at dolor. Vivamus scelerisque nibh vitae eros hendrerit, sit amet laoreet lectus ornare. Nullam quis massa a est imperdiet dictum. Praesent ut elit a sem aliquet fermentum. Donec in mollis lacus. Cras sit amet tortor tincidunt, convallis nibh vitae, luctus magna.",
  ),
];
