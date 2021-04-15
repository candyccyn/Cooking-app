import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/models/category_data.dart';
import 'package:cooking_app/models/menu.dart';
import 'package:flutter/cupertino.dart';

const menuCollection = 'test2';
const categoriesCollection = 'categories';

class CategoryService {
  CollectionReference _categoriesReference =
      FirebaseFirestore.instance.collection(categoriesCollection);

  Future<List<Category>> getAllCategories() async {
    QuerySnapshot querySnapshot = await this._categoriesReference.get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((doc) => Category(doc.data()['categoryName'],
              doc.data()['image'], doc.data()['imageHeader']))
          .toList();
    } else {
      throw Exception("No document found");
    }
  }
}

class MenuService with ChangeNotifier {
  CollectionReference _menuReference =
      FirebaseFirestore.instance.collection(menuCollection);

  Future<List<Menu>> getMenuByFilter(String filter) async {
    QuerySnapshot querySnapshot =
        await _menuReference.where('type', isEqualTo: filter).get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((doc) => Menu(doc.data()['name'], doc.data()['image']))
          .toList();
    } else {
      throw Exception("No document found");
    }
  }

  Future<List<Menu>> getAllMenu() async {
    this._menuReference.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["first_name"]);
      });
    });
  }
}
