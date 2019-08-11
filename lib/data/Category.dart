class Category {
  Category({
    this.id,
    this.image,
    this.name,
  });
  final int id;
  final String image;
  final String name;
}

List<Category> allCategories = [
  Category(
    id: 0,
    image: "lib/picture/categories/woman-category.jpg",
    name: "Woman",
  ),
  Category(
    id: 1,
    image: "lib/picture/categories/man-category.jpg",
    name: "Man",
  ),
  Category(
    id: 2,
    image: "lib/picture/categories/sport-category.png",
    name: "Sport",
  ),
  Category(
    id: 3,
    // image: "lib/picture/categories/sport-category.png",
    name: "Child",
  ),
  Category(
    id: 4,
    // image: "lib/picture/categories/sport-category.png",
    name: "Animal",
  ),
  Category(
    id: 5,
    // image: "lib/picture/categories/sport-category.png",
    name: "Life",
  ),
  Category(
    id: 6,
    // image: "lib/picture/categories/sport-category.png",
    name: "Travel",
  ),
  Category(
    id: 7,
    // image: "lib/picture/categories/sport-category.png",
    name: "Book",
  ),
];
