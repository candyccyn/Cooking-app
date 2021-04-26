import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/models/menu.dart';

const userCollection = 'users';
const menuCollection = 'test2';
const bookmarkCollection = 'bookmarkMenu';

class BookmarkService {
  String _uid;

  CollectionReference _userReference =
      FirebaseFirestore.instance.collection(userCollection);

  CollectionReference _menuReference =
      FirebaseFirestore.instance.collection(menuCollection);

  BookmarkService(String uid) {
    this._uid = uid;
  }

  Future<List<Menu>> getBookmarkMenu() async {
    QuerySnapshot bookmarkSnapshot =
        await _userReference.doc(_uid).collection(bookmarkCollection).get();
    if (bookmarkSnapshot.docs.isNotEmpty) {
      return bookmarkSnapshot.docs
          .map((doc) => Menu(doc.data()['menuName'], doc.data()['image'], doc.data()['menuOwner']))
          .toList();
    } else {
      throw Exception("No review found");
    }
  }

  void testFn() async {
    List<Menu> m = await getBookmarkMenu();
    m.forEach((element) {
      print(element.imagePath);
    });
  }
}
