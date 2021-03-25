import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailService {
  final _userDetails =
      FirebaseFirestore.instance.collection('users');
  var _uid;
  var _userData;

  UserDetailService(String uid) {
    this._uid = uid;
  }

  dynamic getUserImage() async {
    await this._userDetails.doc(this._uid).get().then((value) {
      this._userData = value.data()['urlToImg'];
      return this._userData;
    });

  }
}
