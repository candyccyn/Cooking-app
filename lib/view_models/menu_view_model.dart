import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/services/menu_service.dart';

class MenuViewModel {
  MenuService _menuService = MenuService();
  String _type;

  void filterByType(String type) {
    this._type = type;
  }

  Future<int> getMenuSize() async {
     var data = await _menuService.getMenuByFilter(_type);
     return data.length;
  }

  Future<String> getText(int index) async{
    var data = await _menuService.getMenuByFilter(_type);
    return data[index].menuName;
  }

  Future<String> getImg(int index) async{
    var data = await _menuService.getMenuByFilter(_type);
    return data[index].imagePath;
  }

}