class Category {
  Category({
    this.image,
    this.name,
  });
  final String image;
  final String name;
}

List<Category> allCategories = [
  Category(
    image: "lib/assets/women-category.jpg",
    name: "Women",
  ),
  Category(
    image: "lib/assets/men-category.jpg",
    name: "Men",
  ),
  Category(
    image: "lib/assets/sport-category.png",
    name: "Sports",
  ),
];
