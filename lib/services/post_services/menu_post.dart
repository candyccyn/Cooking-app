import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/models/ingredient.dart';
import 'package:cooking_app/models/step.dart';
import 'package:cooking_app/services/menu_detail_service.dart';
import 'package:cooking_app/services/post_services/user_detail_post.dart';
import 'package:cooking_app/services/user_detail.dart';

const menuCollection = 'test2';
const userCollection = 'users';
const ingredientCollection = 'ingredients';
const stepCollection = 'steps';
const reviewCollection = 'reviews';

class MenuPost {
  String _uid;

  CollectionReference _menuReference =
  FirebaseFirestore.instance.collection(menuCollection);

  CollectionReference _userReference =
  FirebaseFirestore.instance.collection(userCollection);

  UserDetailService userDetailService;
  UserDetailPost userDetailPost;
  MenuDetailService menuDetailService;


  MenuPost(String uid) {
    this._uid = uid;
    userDetailService = UserDetailService(_uid);
  }

  Future<void> createNewMenu(String menuName, String category, String image,
      List<Ingredient> ingredientList, List<Steps> stepList) async {

    var menuOwner = userDetailService.getUsername();

    // adding data to first level of collection
    _menuReference.add({
          'image': image,
      'menuOwner': menuOwner,
      'name': menuName,
      'type': category
        });

    QuerySnapshot menuSnapshot =
        await this._menuReference.where('name', isEqualTo: menuName).get();

    var menuId = menuSnapshot.docs[0].id;
    var ingredientIterator = 1;
    // adding data to second level of collection (step and ingredient)
    // ----> ingredients
    ingredientList.forEach((element) {
      _menuReference.doc(menuId).collection(ingredientCollection)
          .add({
        'amount': element.amount,
        'name': element.name,
        'units': element.units
      });
    });
    // ----> steps
    stepList.forEach((element) {
      _menuReference.doc(menuId).collection(stepCollection)
          .add({
        'text': element.text,
        'time': element.time,
        'unit': element.unit,
        'order': ingredientIterator
      });
      ingredientIterator = ingredientIterator + 1;
    });
    // end of add to menu reference

    // updating user detail for menuOwned
    userDetailPost.addMenuOwned(menuName, image);
  }       // end of create menu function

  Future<void> createReview(String reviewer, String menuName, String text) async {
    QuerySnapshot menuSnapshot = await _menuReference.where('name', isEqualTo: menuName).get();
    var menuId = menuSnapshot.docs[0].id;

    return _menuReference.doc(menuId).collection(reviewCollection).add({
      'reviewer': reviewer,
      'text': text
    });
  }
}