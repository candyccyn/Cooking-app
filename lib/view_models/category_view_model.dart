import 'package:cooking_app/models/category_data.dart';

class CategoryViewModel {
  CategoryData _item = CategoryData();

  int getCategorySize() {
    return _item.data.length;
  }

  String getText(int index) {
    return _item.data[index]["text"];
  }

  String getImg(int index) {
    return _item.data[index]["image"];
  }
}