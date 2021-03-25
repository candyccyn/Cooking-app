import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/services/user_detail.dart';
import 'package:flutter/cupertino.dart';

const userCollection = 'users';

class ProfileViewModel {
  UserDetailService _userDetailService;

  ProfileViewModel(String uid) {
    this._userDetailService = UserDetailService(uid);
  }
}