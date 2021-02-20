import 'package:flutter/cupertino.dart';

class WelcomeViewModel {
  int currentIndex = 0;

  List<Map<String, String>> _data = [
    {"text": "welcome", "image": "assets/images/cooking1.png"},
    {"text": "to", "image": "assets/images/cooking2.png"},
    {"text": "cooking", "image": "assets/images/cooking3.png"},
  ];

  int getDataLength() {
    return _data.length;
  }

  String getText(int index) {
    return _data[index]["text"];
  }

  String getImg(int index) {
    return _data[index]["image"];
  }
}