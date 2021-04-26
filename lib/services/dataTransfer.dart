import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const menuCollection = 'menu';
const test2Collection = 'test2';

class DataTransfer {
  CollectionReference _menuReference =
  FirebaseFirestore.instance.collection(menuCollection);

  CollectionReference _testReference =
  FirebaseFirestore.instance.collection(test2Collection);

  // Retrieving data
  Future getAsianFood(String name, int ingredientSize, int stepSize) async {
    String queryName = name;
    DocumentSnapshot documentSnapshot = await _menuReference.doc('european-food').get();
    var data = documentSnapshot.data()[queryName];
    print(data);
    var menuCategory = 'European Food';
    var menuName = queryName;
    var menuOwner = data['owner'];
    var image = data['image'];
    List ingredientList = [];
    List stepList = [];

    for(int i = 1; i < ingredientSize + 1; i++) {
      ingredientList.add(data['ingredients'][i.toString()]);
    }

    for(int i = 1; i < stepSize + 1; i++) {
      stepList.add(data['steps'][i.toString()]);
    }

    return {
      'image': image,
      'menuOwner': menuOwner,
      'menuName': menuName,
      'type': menuCategory,
      'ingredientList': ingredientList,
      'stepList': stepList
    };
  }       // end of getAsianFood Fn()

  Future<void> transferCollection(var data) async {
    // Adding the first level
    try {
      await _testReference.add({
        'image': data['image'],
        'menuOwner': data['menuOwner'],
        'name': data['menuName'],
        'type': data['type']
      });
    } catch (e) { print("error first level"); }

    var currentMenu = await _testReference.where('name', isEqualTo: data['menuName']).get();
    var id = currentMenu.docs[0].id;

    // Add the second level
    try {
      data['ingredientList'].forEach((element) {
        _testReference.doc(id).collection('ingredients').add({
          'amount': element[1],
          'name': element[0],
          'units': element[2]
        });
      });
    } catch (e) { print("error ingredient"); }

    var stepIterator = 1;

    try {
      data['stepList'].forEach((element) {
        _testReference.doc(id).collection('steps').add({
          'amount': element[1],
          'name': element[0],
          'units': element[2],
          'order': stepIterator
        });
        stepIterator = stepIterator + 1;
      });
    } catch (e) { print("error steps"); }

    print("-------- Transfer Done --------");
  }
}