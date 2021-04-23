import 'package:cooking_app/models/ingredient.dart';
import 'package:cooking_app/models/review.dart';
import 'package:cooking_app/models/step.dart';

class MenuDetail {
  String menuOwner;
  List<Review> reviewList;
  List<Step> stepList;
  List<Ingredient> ingredientList;

  MenuDetail(String menuOwner, List<Review> reviewList, List<Step> stepList,
      List<Ingredient> ingredientList) {
    this.menuOwner = menuOwner;
    this.reviewList = reviewList;
    this.stepList = stepList;
    this.ingredientList = ingredientList;
  }
}
