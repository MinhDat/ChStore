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
    image: "lib/pictures/woman-category.jpg",
    name: "Woman",
  ),
  Category(
    id: 1,
    image: "lib/pictures/man-category.jpg",
    name: "Man",
  ),
  Category(
    id: 2,
    image: "lib/pictures/sport-category.png",
    name: "Sport",
  ),
];
