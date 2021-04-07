import 'package:cooking_app/models/category_header_data.dart';

class CategoryHeaderViewModel {
  CategoryHeaderData _item = CategoryHeaderData();

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