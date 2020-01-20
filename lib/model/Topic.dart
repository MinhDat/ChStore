class Topic {
  Topic({
    this.id,
    this.image,
    this.name,
  });
  final int id;
  final String image;
  final String name;
}

List<Topic> allTopics = [
  Topic(
    id: 6,
    image: "lib/picture/topics/woman-category.jpg",
    name: "Woman",
  ),
  Topic(
    id: 7,
    image: "lib/picture/topics/man-category.jpg",
    name: "Man",
  ),
  Topic(
    id: 0,
    image: "lib/picture/topics/sport-category.png",
    name: "Sport",
  ),
  Topic(
    id: 8,
    // image: "lib/picture/topics/sport-category.png",
    name: "Child",
  ),
  Topic(
    id: 9,
    // image: "lib/picture/topics/sport-category.png",
    name: "Animal",
  ),
  Topic(
    id: 10,
    // image: "lib/picture/topics/sport-category.png",
    name: "Life",
  ),
  Topic(
    id: 1,
    // image: "lib/picture/topics/sport-category.png",
    name: "Travel",
  ),
  Topic(
    id: 11,
    // image: "lib/picture/topics/sport-category.png",
    name: "Book",
  ),
];
