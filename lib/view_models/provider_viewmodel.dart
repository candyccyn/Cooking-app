import 'package:flutter/cupertino.dart';

class ProviderData extends ChangeNotifier {
  String data = "Some data";

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}
