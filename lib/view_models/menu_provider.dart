import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/models/category_data.dart';
import 'package:cooking_app/models/ingredient.dart';
import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/models/menu_detail_data.dart';
import 'package:cooking_app/models/step.dart';
import 'package:cooking_app/models/review.dart';
import 'package:cooking_app/services/menu_service.dart';
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

  String _profileDescription = "";
  String _profilePathImage = "";

  String _pickCategory = "";

  Future<DocumentSnapshot> _userDetail = null;

  String _menuType = "";
  List<Category> _categories = [];
  List<Menu> _menus = [];
  List<Menu> _pickCategoryData = [];
  List<Menu> _bookmarkData = [];
  List<Menu> _ownMenu = [];

  List<Review> _reviewList = [];
  List<Ingredient> _ingredientList = [];
  List<Steps> _stepList = [];

  String _pickRecipe = "";
  String _menuOwner = "";
  String _imagePath = "";

  int _currentStep = 0;
  int _duration = 0;

  String _userNamePost = "";
  String _userBioPost = "";
  String _userImageLinkPost = "";

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
  get getMenuType => _menuType;
  get getMenuImagePath => _imagePath;
  get getBookmarkData => _bookmarkData;

  get getProfilePathImage => _profilePathImage;
  get getProfileDescription => _profileDescription;

  get getDuration => _duration;
  get getCurrentStep => _currentStep;

  get getOwnMenu => _ownMenu;

  get getUserUserName => _userNamePost;
  get getUserBioPost => _userBioPost;
  get getUserImagePost => _userImageLinkPost;

  void setUid(String uid) {
    this._uid = uid;
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

  void setMenuType(String menuType) {
    _menuType = menuType;
    notifyListeners();
  }

  void setMenuImagePath(String imagePath) {
    _imagePath = imagePath;
    notifyListeners();
  }

  void setBookmarkData(List<Menu> bookmarkData) {
    _bookmarkData = bookmarkData;
    notifyListeners();
  }

  void setMenuDetail(MenuDetail menuDetail) {
    setMenuOwner(menuDetail.menuOwner);
    setMenuImagePath(menuDetail.imagePath);
    setMenuType(menuDetail.menuType);
    setReviewList(menuDetail.reviewList);
    setStepList(menuDetail.stepList);
    setIngredientList(menuDetail.ingredientList);

    notifyListeners();
  }

  void setDuration(int duration) {
    _duration = duration;
    notifyListeners();
  }

  void setCurrentStep(int currentStep) {
    _currentStep = currentStep;
    notifyListeners();
  }

  String setAlltime(List<Steps> stepList) {
    int allTime = 0;
    for (Steps step in stepList) {
      allTime += step.time;
    }
    return allTime.toString();
  }

  void setProfileDescription(String profileDescription) {
    _profileDescription = profileDescription;
    notifyListeners();
  }

  void setProfileImagePath(String profileImagePath) {
    _profilePathImage = profileImagePath;
    notifyListeners();
  }

  void setOwnMenu(List<Menu> ownMenu) {
    _ownMenu = ownMenu;
    notifyListeners();
  }

  void setUserNamePost(String userNamePost) {
    _userNamePost = userNamePost;
    notifyListeners();
  }

  void setUserBioPost(String userBioPost) {
    _userBioPost = userBioPost;
    notifyListeners();
  }

  void setUserImageLinkPost(String userImageLinkPost) {
    _userImageLinkPost = userImageLinkPost;
    notifyListeners();
  }

  bool isSetBookmark(menuName, bookmarkData) {
    for (Menu bData in bookmarkData) {
      if (bData.menuName == menuName) {
        return true;
      } else {
        continue;
      }
    }
    return false;
  }
}
