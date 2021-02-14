import 'package:firebase_auth/firebase_auth.dart';
import 'package:cooking_app/models/cooking_user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  CookingUser _cookingUserFromFirebaseUser(User user) {

    return CookingUser != null ? CookingUser(uid: user.uid): null;
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;  // This "User" object is Firebase user class
      return _cookingUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}