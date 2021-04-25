import 'package:cloud_firestore/cloud_firestore.dart';

const userCollection = 'users';
const bookmarkCollection = 'bookmarkMenu';

class BookmarkPost {
  String _uid;

  CollectionReference _userReference =
  FirebaseFirestore.instance.collection(userCollection);

  CollectionReference _bookmarkReference;

  BookmarkPost(String uid) {
    this._uid = uid;
    this._bookmarkReference = this._userReference.doc(this._uid).collection(bookmarkCollection);
  }

  Future<void> addBookmark(String menuName, String menuImage) {
    return this._bookmarkReference.add({
      'menuName': menuName,
      'image': menuImage
    })
    .catchError((error) => print("Add bookmark error"));
  }

  Future<void> removeBookmark(String menuName) async {
    QuerySnapshot querySnapshot = await this._bookmarkReference.where('menuName', isEqualTo: menuName).get();
    var docId = querySnapshot.docs[0].id;

    return this._bookmarkReference.doc(docId).delete()
        .catchError((error) => print("Delete bookmark error"));
  }
}