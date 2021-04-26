import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/models/ingredient.dart';
import 'package:cooking_app/models/menu_detail_data.dart';
import 'package:cooking_app/models/review.dart';
import 'package:cooking_app/models/step.dart';

const menuCollection = 'test2';
const reviewCollection = 'reviews';
const stepCollection = 'steps';
const ingredientCollection = 'ingredients';

class MenuDetailService {
  CollectionReference _menuReference =
      FirebaseFirestore.instance.collection(menuCollection);

  String _menuName;

  String _menuOwner = "";
  String _imagePath = "";
  String _menuType = "";
  List<Review> _commentList;
  List<Steps> _stepList;
  List<Ingredient> _ingredientList;

  MenuDetailService(String menuName) {
    this._menuName = menuName;
  }

  Future<MenuDetail> assignMenuData() async {
    QuerySnapshot querySnapshot = await this
        ._menuReference
        .where('name', isEqualTo: this._menuName)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      var data = querySnapshot.docs[0].data();
      var menuId = querySnapshot.docs[0].id;
      this._imagePath = data['image'];
      this._menuOwner = data['menuOwner'];
      this._menuType = data['type'];

      this._commentList = await fetchReview(menuId);
      this._stepList = await fetchStep(menuId);
      this._ingredientList = await fetchIngredient(menuId);

      return MenuDetail(this._menuOwner, this._imagePath, this._menuType,
          this._commentList, this._stepList, this._ingredientList);
    } else {
      throw Exception("No document found");
    }
  }

  Future<List<Review>> fetchReview(var docId) async {
    QuerySnapshot reviewSnapshot =
        await _menuReference.doc(docId).collection(reviewCollection).get();

    if (reviewSnapshot.docs.isNotEmpty) {
      return reviewSnapshot.docs
          .map((doc) => Review(doc.data()['text'], doc.data()['reviewer']))
          .toList();
    } else {
      throw Exception("No reviews found");
    }
  }

  Future<List<Steps>> fetchStep(var docId) async {

    QuerySnapshot reviewSnapshot =
        await _menuReference.doc(docId).collection(stepCollection).orderBy('order').get();

    if (reviewSnapshot.docs.isNotEmpty) {
      return reviewSnapshot.docs
          .map((doc) =>
              Steps(doc.data()['text'], doc.data()['time'], doc.data()['unit']))
          .toList();
    } else {
      throw Exception("No steps found");
    }
  }

  Future<List<Ingredient>> fetchIngredient(var docId) async {
    QuerySnapshot reviewSnapshot =
        await _menuReference.doc(docId).collection(ingredientCollection).get();

    if (reviewSnapshot.docs.isNotEmpty) {
      return reviewSnapshot.docs
          .map((doc) => Ingredient(doc.data()['name'], doc.data()['units'],
              doc.data()['amount'].toDouble()))
          .toList();
    } else {
      throw Exception("No ingredients found");
    }
  }
}
