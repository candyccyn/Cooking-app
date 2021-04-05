import '../models/menu.dart';

class MenuViewModel {
  Menu _item = Menu();

  int getMenuSize() {
    return _item.data.length;
  }

  String getText(int index) {
    return _item.data[index]["text"];
  }

  String getImg(int index) {
    return _item.data[index]["image"];
  }
}