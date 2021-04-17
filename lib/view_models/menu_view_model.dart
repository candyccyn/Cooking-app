import 'package:cooking_app/services/menu_service.dart';

class MenuViewModel {
  MenuService _menuService = MenuService();

  Future<int> getMenuSize() async {
     var data = await _menuService.getMenuByFilter('asian-food');
     return data.length;
  }

  Future<String> getText(int index) async{
    var data = await _menuService.getMenuByFilter('asian-food');
    return data[index].menuName;
  }

  Future<String> getImg(int index) async{
    var data = await _menuService.getMenuByFilter('asian-food');
    return data[index].imagePath;
  }
}