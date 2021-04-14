import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/models/category_data.dart';
import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/services/user_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuProvider extends ChangeNotifier {
  String _username = "";
  String _uid = "";

  String _pickCategory = "";

  Future<DocumentSnapshot> _userDetail = null;
  List<Category> _categories = [];
  List<Menu> _menus = [];

  Color _boxColor = Color.fromRGBO(255, 255, 255, 1);
  Color _textColor = Color.fromRGBO(255, 149, 24, 0.89);

  bool _isPress = false;

  get getUid => _uid;
  get getUsername => _username;
  get getPickCategory => _pickCategory;
  get getCategory => _categories;
  get getUserDetail => _userDetail;
  get getRecommendedMenu => _menus;
  get getIsPress => _isPress;

  void setUid(String uid) {
    UserDetailService userDetailService = UserDetailService(uid);
    _userDetail = userDetailService.getUserDetails();

    setUserDetail(_userDetail);
    _userDetail
        .then((value) => setUsername(value.data()["username"].toString()));
    notifyListeners();
  }

  void setUserDetail(Future<DocumentSnapshot> data) {
    _userDetail = data;
    notifyListeners();
  }

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPickCategory(String pickCategories) {
    _pickCategory = pickCategories;
    notifyListeners();
  }

  void setCategory(List<Category> categories) {
    _categories = categories;
    notifyListeners();
  }

  void setRecommended(List<Menu> menus) {
    _menus = menus;
    notifyListeners();
  }

  void setIsPress(bool isPress) {
    _isPress = isPress;
    _boxColor = Color.fromRGBO(255, 149, 24, 0.89);
    _textColor = Color.fromRGBO(255, 255, 255, 1);
    notifyListeners();
  }
}
