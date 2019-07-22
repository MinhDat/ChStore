class PopularCategory {
  PopularCategory({
    this.id,
    this.name,
  });
  final int id;
  final String name;
}

class PopularTag {
  PopularTag({
    this.id,
    this.name,
  });
  final int id;
  final String name;
}

List<PopularCategory> popularCategories = [
  PopularCategory(
    id: 0,
    name: "Woman",
  ),
  PopularCategory(
    id: 1,
    name: "Man",
  ),
  PopularCategory(
    id: 2,
    name: "Sport",
  ),
  PopularCategory(
    id: 3,
    name: "Politics",
  ),
  PopularCategory(
    id: 4,
    name: "Travel",
  ),
  PopularCategory(
    id: 5,
    name: "Movies",
  ),
];

List<PopularCategory> popularTags = [
  PopularCategory(
    id: 0,
    name: "Ronaldo",
  ),
  PopularCategory(
    id: 1,
    name: "Lil Wayne",
  ),
  PopularCategory(
    id: 2,
    name: "Sport",
  ),
  PopularCategory(
    id: 3,
    name: "Heidi",
  ),
  PopularCategory(
    id: 4,
    name: "Travel",
  ),
  PopularCategory(
    id: 5,
    name: "Perfect",
  ),
];
