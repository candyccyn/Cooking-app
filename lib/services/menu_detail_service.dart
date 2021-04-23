import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/models/menu_detail_data.dart';
import 'package:cooking_app/models/review.dart';

const menuCollection = 'test2';
const reviewCollection = 'reviews';

class MenuDetailService {
  CollectionReference _menuReference =
      FirebaseFirestore.instance.collection(menuCollection);

  String _menuName;

  String _menuOwner = "";
  List<Review> _commentList;

  MenuDetailService(String menuName) {
    this._menuName = menuName;
  }

  Future<MenuDetail> assignMenuData() async {
    QuerySnapshot querySnapshot =
        await this._menuReference.where('name', isEqualTo: 'food__3').get();

    if (querySnapshot.docs.isNotEmpty) {
      var data = querySnapshot.docs[0].data();
      var menuId = querySnapshot.docs[0].id;
      this._menuOwner = data['menuOwner'];
      this._commentList = await fetchReview(menuId);

      return MenuDetail(this._menuOwner, this._commentList);
    } else {
      throw Exception("No document found");
    }
  }

  Future<List<Review>> fetchReview(var docId) async {
    QuerySnapshot reviewSnapshot =
        await _menuReference.doc(docId).collection(reviewCollection).get();

    if (reviewSnapshot.docs.isNotEmpty) {
      return reviewSnapshot.docs
          .map((doc) => Review(doc.data()['text']))
          .toList();
    } else {
      throw Exception("No review found");
    }
  }
}
