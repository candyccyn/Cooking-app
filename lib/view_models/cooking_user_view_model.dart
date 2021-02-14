import 'package:cooking_app/models/cooking_user.dart';
import 'package:cooking_app/services/auth.dart';

class CookingUserViewModel {
  CookingUser _cookingUser;
  AuthService _auth = AuthService();


  void signInAnon() async {

    dynamic result = await _auth.signInAnon();

    _cookingUser = result;
  }

  String get uid {
    return _cookingUser.uid;
  }
}