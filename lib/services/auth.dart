import 'package:cooking_app/services/post_services/auth_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cooking_app/models/cooking_user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthPost _authPost = AuthPost();

  CookingUser _cookingUserFromFirebaseUser(User user) {
    return CookingUser != null ? CookingUser(uid: user.uid) : null;
  }

  // testing the connection from flutter to firebase auth
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
      User user =
          userCredential.user; // This "User" class is Firebase user class
      return _cookingUserFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future signInGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User user = userCredential.user;
      return _cookingUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future createAccountFromEmail(String email, String username, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var uid = userCredential.user.uid;

      _authPost.createNewUserAccount(uid, username);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
