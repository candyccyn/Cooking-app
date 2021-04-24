import 'package:cooking_app/models/ingredient.dart';
import 'package:cooking_app/models/review.dart';
import 'package:cooking_app/models/step.dart';

class MenuDetail {
  String menuOwner, imagePath, menuType;
  List<Review> reviewList;
  List<Steps> stepList;
  List<Ingredient> ingredientList;

  MenuDetail(
      String menuOwner,
      String imagePath,
      String menuType,
      List<Review> reviewList,
      List<Steps> stepList,
      List<Ingredient> ingredientList) {
    this.menuOwner = menuOwner;
    this.imagePath = imagePath;
    this.menuType = menuType;
    this.reviewList = reviewList;
    this.stepList = stepList;
    this.ingredientList = ingredientList;
  }
}
