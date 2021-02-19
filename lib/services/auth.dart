import 'package:firebase_auth/firebase_auth.dart';
import 'package:cooking_app/models/cooking_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CookingUser _cookingUserFromFirebaseUser(User user) {
    return CookingUser != null ? CookingUser(uid: user.uid) : null;
  }

  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user =
          userCredential.user; // This "User" object is Firebase user class
      return _cookingUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _cookingUserFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
