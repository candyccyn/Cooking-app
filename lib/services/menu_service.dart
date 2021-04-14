// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cooking_app/models/menu.dart';
//
// const menuCollection = 'test2';
//
// class MenuService {
//   CollectionReference _menuReference =
//       FirebaseFirestore.instance.collection(menuCollection);
//
//   Future<List<Menu>> getMenuByFilter(String filter) async {
//     QuerySnapshot querySnapshot =
//         await _menuReference.where('type', isEqualTo: filter).get();
//
//     if (querySnapshot.docs.isNotEmpty) {
//       return querySnapshot.docs
//           .map((doc) => Menu(doc.data()['name'], doc.data()['image']))
//           .toList();
//     } else {
//       throw Exception("No document found");
//     }
//   }
//
//   Future<List<Menu>> getAllMenu() async {
//     this._menuReference.get().then((QuerySnapshot querySnapshot) {
//       querySnapshot.docs.forEach((doc) {
//         print(doc["first_name"]);
//       });
//     });
//   }
// }
