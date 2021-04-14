// class Menu {
//   String menuName;
//   String imagePath;
//
//   Menu(String menuName, String imagePath) {
//     this.menuName = menuName;
//     this.imagePath = imagePath;
//   }
// }

class Menu {
  final String menuName;

  Menu({this.menuName});

  List<Map<String, String>> data = [
    {"text": "Portuguese Egg Tarts", "image": "assets/images/tart.png"},
    {"text": "Grilled Salmon Steak", "image": "assets/images/salmon steak.png"},
    {"text": "Portuguese Egg Tarts", "image": "assets/images/tart.png"},
    {"text": "Grilled Salmon Steak", "image": "assets/images/salmon steak.png"},
    {"text": "Portuguese Egg Tarts", "image": "assets/images/tart.png"},
    {"text": "Grilled Salmon Steak", "image": "assets/images/salmon steak.png"},
  ];
}