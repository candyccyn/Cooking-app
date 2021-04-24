import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/models/category_data.dart';
import 'package:cooking_app/models/ingredient.dart';
import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/models/menu_detail_data.dart';
import 'package:cooking_app/models/step.dart';
import 'package:cooking_app/models/review.dart';
import 'package:cooking_app/services/user_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String findImagePathfromCategory(List<Category> menus, String category) {
  for (var menu in menus) {
    if (menu.categoryName == category) {
      return menu.imageHeaderPath;
    } else {
      continue;
    }
  }
}

class MenuProvider extends ChangeNotifier {
  String _username = "";
  String _uid = "";

  String _pickCategory = "";

  Future<DocumentSnapshot> _userDetail = null;

  List<Category> _categories = [];
  List<Menu> _menus = [];
  List<Menu> _pickCategoryData = [];
  List<Review> _reviewList = [];
  List<Ingredient> _ingredientList = [];
  List<Steps> _stepList = [];

  String _pickRecipe = "";
  String _menuOwner = "";

  get getUid => _uid;
  get getUsername => _username;
  get getPickCategory => _pickCategory;
  get getPickedCategoryData => _pickCategoryData;
  get getCategory => _categories;
  get getUserDetail => _userDetail;
  get getRecommendedMenu => _menus;
  get getPickReciepe => _pickRecipe;
  get getMenuOwner => _menuOwner;
  get getReviewList => _reviewList;
  get getIngredientList => _ingredientList;
  get getStepList => _stepList;

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

  void setPickedCategoryData(List<Menu> pickCategoryData) {
    _pickCategoryData = pickCategoryData;
    notifyListeners();
  }

  void setPickedRecipe(String menuName) {
    _pickRecipe = menuName;
    notifyListeners();
  }

  void setReviewList(List<Review> reviewList) {
    _reviewList = reviewList;
    notifyListeners();
  }

  void setMenuOwner(String menuOwner) {
    _menuOwner = menuOwner;
    notifyListeners();
  }

  void setIngredientList(List<Ingredient> ingredientList) {
    _ingredientList = ingredientList;
    notifyListeners();
  }

  void setStepList(List<Steps> stepList) {
    _stepList = stepList;
    notifyListeners();
  }

  void setMenuDetail(MenuDetail menuDetail) {
    setMenuOwner(menuDetail.menuOwner);
    setReviewList(menuDetail.reviewList);
    setIngredientList(menuDetail.ingredientList);
    setStepList(menuDetail.stepList);
  }

  String setAlltime(List<Steps> stepList) {
    int allTime = 0;
    for (Steps step in stepList) {
      allTime += step.time;
    }
    //print(allTime);
    return allTime.toString();
  }
}
