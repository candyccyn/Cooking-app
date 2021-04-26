import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/models/menu.dart';

const userCollection = 'users';
const menuOwnedCollection = 'menuOwned';

class UserDetailService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection(userCollection);

  var _uid;

  UserDetailService(String uid) {
    this._uid = uid;
  }

  Future<DocumentSnapshot> getUserDetails() async {
    return await this._userReference.doc(this._uid).get();
  }

  Future<String> getUsername() async {
    DocumentSnapshot userSnapshot = await _userReference.doc(_uid).get();
    return userSnapshot.data()['username'];
  }

  Future<String> getUserImage() async {
    DocumentSnapshot userSnapshot = await _userReference.doc(_uid).get();
    return userSnapshot.data()['urlToImg'];
  }

  Future<List<Menu>> getMenuOwned() async {
    QuerySnapshot menuOwnedSnapshot = await _userReference.doc(_uid).collection(menuOwnedCollection).get();
    if (menuOwnedSnapshot.docs.isNotEmpty) {
      return menuOwnedSnapshot.docs
          .map((doc) => Menu(doc.data()['menuName'], doc.data()['image']))
          .toList();
    } else {
      throw Exception("No review found");
    }
  }

  Future<String> getBio() async {
    DocumentSnapshot userSnapshot = await _userReference.doc(_uid).get();
    return userSnapshot.data()['bio'];
  }
}
