import 'package:cooking_app/models/cooking_user.dart';
import 'package:cooking_app/services/auth.dart';

class CookingUserViewModel {
  CookingUser _cookingUser;
  AuthService _auth = AuthService();

  // List... _socialLogin = [];

  void signInAnon() async {
    _cookingUser = await _auth.signInAnon();
  }

  void signInEmail(String email, String password) async {
    _cookingUser = await _auth.signInEmail(email, password);
  }

  void signInGoogle() async {
    _cookingUser = await _auth.signInGoogle();
  }

  void signInFacebook() async {
    return null;// TODO implement auth service
  }

  void signInTwitter() async {
    return null;// TODO implement auth service
  }

  String get uid {
    return _cookingUser.uid;
  }
}