import 'package:cooking_app/models/welcome_body_data.dart';

class WelcomeViewModel {
  int currentIndex = 0;

  WelcomeBodyData _item = WelcomeBodyData();

  int getDataLength() {
    return _item.data.length;
  }

  String getText(int index) {
    return _item.data[index]["text"];
  }

  String getImg(int index) {
    return _item.data[index]["image"];
  }
}