import 'package:cloud_firestore/cloud_firestore.dart';

const menuCollection = 'test2';
const userCollection = 'users';

class MenuPost {
  String _uid;

  CollectionReference _menuReference =
  FirebaseFirestore.instance.collection(menuCollection);

  CollectionReference _userReference =
  FirebaseFirestore.instance.collection(userCollection);

  MenuPost(String uid) {
    this._uid = uid;
  }

  Future<void> createNewMenu() {
    print("None");
  }
}