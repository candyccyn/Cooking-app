// class Menu {
//   final String menuName;
//
//   Menu({this.menuName});
//
//   List<Map<String, String>> data = [
//     {"text": "Portuguese Egg Tarts", "image": "assets/images/tart.png"},
//     {"text": "Grilled Salmon Steak", "image": "assets/images/salmon steak.png"},
//     {"text": "Portuguese Egg Tarts", "image": "assets/images/tart.png"},
//     {"text": "Grilled Salmon Steak", "image": "assets/images/salmon steak.png"},
//     {"text": "Portuguese Egg Tarts", "image": "assets/images/tart.png"},
//     {"text": "Grilled Salmon Steak", "image": "assets/images/salmon steak.png"},
//   ];
//
// }

class Menu {
  final int id;
  final String title;
  final List<String> images;
  final double rating;
  final bool isLike, isPopular;

  Menu({
    this.id,
    this.title,
    this.images,
    this.rating = 0.0,
    this.isLike = false,
    this.isPopular = false,
  });
}

List<Menu> demoMenu = [
  Menu(
    id: 1,
    images: ["assets/images/tart.png"],
    title: "Portuguese Egg Tarts",
    rating: 4.8,
    isLike: true,
    isPopular: true,
  ),
  Menu(
    id: 2,
    images: [
      "assets/images/salmon steak.png",
    ],
    title: "Grilled Salmon Steak",
    rating: 4.1,
    isPopular: true,
  ),
  Menu(
    id: 3,
    images: ["assets/images/tart.png"],
    title: "Portuguese Egg Tarts",
    rating: 4.8,
    isLike: true,
    isPopular: true,
  ),
  Menu(
    id: 4,
    images: [
      "assets/images/salmon steak.png",
    ],
    title: "Grilled Salmon Steak",
    rating: 4.1,
    isPopular: true,
  ),
];
