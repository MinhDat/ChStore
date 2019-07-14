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
    image: "lib/assets/woman-category.jpg",
    name: "Woman",
  ),
  Category(
    id: 1,
    image: "lib/assets/man-category.jpg",
    name: "Man",
  ),
  Category(
    id: 2,
    image: "lib/assets/sport-category.png",
    name: "Sport",
  ),
];
