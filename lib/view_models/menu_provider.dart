import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/models/category_data.dart';
import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/services/user_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuProvider extends ChangeNotifier {
  String _username = "";
  String _uid = "";

  Future<DocumentSnapshot> _userDetail = null;
  List<Category> _categories = [];
  List<Menu> _menus = [];

  get getUid => _uid;
  get getUsername => _username;
  get getCategory => _categories;
  get getUserDetail => _userDetail;
  get getRecommendedMenu => _menus;

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

  void setCategory(List<Category> categories) {
    _categories = categories;
    notifyListeners();
  }

  void setRecommended(List<Menu> menus) {
    _menus = menus;
    notifyListeners();
  }
}
