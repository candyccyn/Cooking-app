import 'package:cooking_app/models/cooking_user.dart';
import 'package:cooking_app/services/auth.dart';

class CookingUserViewModel {
  CookingUser _cookingUser;
  AuthService _auth = AuthService();

  Future signInAnon() async {
    _cookingUser = await _auth.signInAnon();
  }

  Future signInEmail(String email, String password) async {
    _cookingUser = await _auth.signInEmail(email, password);
  }

  Future signInGoogle() async {
    _cookingUser = await _auth.signInGoogle();
  }

  Future signInFacebook() async {
    return null;// TODO implement auth service
  }

  Future signInTwitter() async {
    return null;// TODO implement auth service
  }

  String get uid {
    return _cookingUser.uid;
  }
}