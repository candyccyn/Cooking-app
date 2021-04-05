import 'package:cloud_firestore/cloud_firestore.dart';

const userCollection = 'users';

class UserDetailService {
  CollectionReference _userDetails =
  FirebaseFirestore.instance.collection(userCollection);

  var _uid;

  UserDetailService(String uid) {
    this._uid = uid;
  }

  Future<DocumentSnapshot> getUserDetails() {
    return this._userDetails.doc(this._uid).get();
  }
}
