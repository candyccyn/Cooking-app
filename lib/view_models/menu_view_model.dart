// import 'package:cooking_app/services/menu_service.dart';
//
// class MenuViewModel {
//   MenuService _menuService = MenuService();
//
//   Future<int> getMenuSize() async {
//      var data = await _menuService.getMenuByFilter('asian-food');
//      return data.length;
//   }
//
//   Future<String> getText(int index) async{
//     var data = await _menuService.getMenuByFilter('asian-food');
//     return data[index].menuName;
//   }
//
//   Future<String> getImg(int index) async{
//     var data = await _menuService.getMenuByFilter('asian-food');
//     return data[index].imagePath;
//   }
// }

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