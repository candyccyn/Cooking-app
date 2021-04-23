import 'package:cooking_app/models/review.dart';

class MenuDetail {
  String menuOwner;
  List<Review> reviewList;

  MenuDetail(String menuOwner, List<Review> reviewList) {
    this.menuOwner = menuOwner;
    this.reviewList = reviewList;
  }
}
