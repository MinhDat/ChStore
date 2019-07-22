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
    image: "lib/pictures/men/man_and_the_streets.jpeg",
    name: "Life is always the difficulties and challenges",
    price: "65.00",
    description:
        "A man always smiles in front of someone but he always hides his sad in behind (man and the streets)",
  ),
  Product(
    id: 1,
    image: "lib/pictures/women/woman_and_sunset.jpeg",
    name: "A woman and the sunset",
    price: "65.00",
    description: "A woman was wearing black hat and staring at the sunset",
  ),
  Product(
    id: 2,
    image: "lib/pictures/travels/girl_and_beaches.jpg",
    name: "Tiny girl and the beach (I miss u)",
    price: "65.00",
    description:
        "A girl was wearing pink dress and being the side with the beach",
  ),
  Product(
    id: 3,
    image: "lib/pictures/children/boy_and_teddy.jpeg",
    name: "A boy and his teddy",
    price: "65.00",
    description: "When I was a child, I dreamed to become a hero",
  ),
  Product(
      id: 4,
      image: "lib/pictures/animals/girl_and_dog.jpeg",
      name: "Tiny girl and corgi dog",
      price: "65.00",
      description: "I'm looking a dog"),
  Product(
    id: 5,
    image: "lib/pictures/lifes/bad_boy.jpeg",
    name: "Bad boy",
    price: "65.00",
    description:
        "I before might be a bad person, but I now  still always try to become perfect",
  ),
  Product(
    id: 6,
    image: "lib/pictures/women/alone_girl.jpeg",
    name: "Sometimes I want alone",
    price: "65.00",
    description: "Alone make me stronger, but it makes me a crazy -_-",
  ),
  Product(
    id: 7,
    image: "lib/pictures/lifes/man_is_walking_in_desert.png",
    name: "And sometimes I forget that I'm still a human being",
    price: "65.00",
    description: "Maybe I'm too greedy",
  ),
  Product(
    id: 8,
    image: "lib/pictures/books/diary.jpg",
    name: "The pieces of stories are separate",
    price: "65.00",
    description:
        "Because it is my diary which is my feelings are implemented on the lines of code.",
  )
];
