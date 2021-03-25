import 'package:cooking_app/services/user_detail.dart';

const userCollection = 'users';

class ProfileViewModel {
  UserDetailService userDetailService;
  String _userId;

  var urlToImg;
  var menuOwned;
  var bookmarksMenu;
  var username;

  ProfileViewModel(String uid) {
    this._userId = uid;
    this.userDetailService = UserDetailService(this._userId);
  }

  dynamic getImage() async{
    return await this.userDetailService.getUserImage();
  }
}