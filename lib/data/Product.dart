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
    categoryId: 1,
    image: "lib/picture/men/man_and_the_streets.jpeg",
    name: "Life is always the difficulties and challenges",
    price: "65.00",
    description:
        "A man always smiles in front of someone but he always hides his sad in behind (man and the streets)",
  ),
  Product(
    id: 1,
    image: "lib/picture/women/woman_and_sunset.jpeg",
    name: "A woman and the sunset",
    price: "65.00",
    description: "A woman was wearing black hat and staring at the sunset",
  ),
  Product(
    id: 2,
    categoryId: 6,
    image: "lib/picture/travels/girl_and_beaches.jpg",
    name: "Tiny girl and the beach (I miss u)",
    price: "65.00",
    description:
        "A girl was wearing pink dress and being the side with the beach.\nI hate you. But I love you.\nI will wait you.\nYou can wait me.",
  ),
  Product(
    id: 3,
    categoryId: 3,
    image: "lib/picture/children/boy_and_teddy.jpeg",
    name: "A boy and his teddy",
    price: "65.00",
    description: "When I was a child, I dreamed to become a hero",
  ),
  Product(
    id: 4,
    categoryId: 4,
    image: "lib/picture/animals/girl_and_dog.jpeg",
    name: "Tiny girl and corgi dog",
    price: "65.00",
    description: "I'm looking a dog",
  ),
  Product(
    id: 5,
    categoryId: 5,
    image: "lib/picture/lifes/bad_boy.jpeg",
    name: "Bad boy",
    price: "65.00",
    description:
        "I before might be a bad person, but I now  still always try to become perfect",
  ),
  Product(
    id: 6,
    image: "lib/picture/women/alone_girl.jpeg",
    name: "Sometimes I want alone",
    price: "65.00",
    description: "Alone make me stronger, but it makes me a crazy -_-",
  ),
  Product(
    id: 7,
    categoryId: 5,
    image: "lib/picture/lifes/man_is_walking_in_desert.png",
    name: "And sometimes I forget that I'm still a human being",
    price: "65.00",
    description: "Maybe I'm too greedy",
  ),
  Product(
    id: 8,
    categoryId: 7,
    image: "lib/picture/books/diary.jpg",
    name: "The pieces of stories are separate",
    price: "65.00",
    description:
        "Because it is my diary which is my feelings are implemented on the lines of code.",
  )
];

List<Product> allShoppingCarts = <Product>[];
