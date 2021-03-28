import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProviderData extends ChangeNotifier {
  String data = "Some data";
  String textMessage = "username";
  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }

  void showUsername(
      BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) async {
    if (snapshot.hasError) {
      textMessage = "Something went wrong";
    }
    if (snapshot.connectionState == ConnectionState.done) {
      Map<String, dynamic> data = snapshot.data.data();
      textMessage = "Full Name: ${data['username']}";
    }
    notifyListeners();
  }
}
