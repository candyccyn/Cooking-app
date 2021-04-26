import 'package:cloud_firestore/cloud_firestore.dart';

const userCollection = 'users';

class AuthPost {
  CollectionReference _userReference =
  FirebaseFirestore.instance.collection(userCollection);

  Future<void> createNewUserAccount(String uid, String username) async {
    return _userReference.doc(uid).set({
      "bio": "",
      "urlToImg": "",
      "username": username
    });
  }
}