//import 'package:cooking_app/models/username_provider.dart';
// import 'dart:html';

import 'package:cooking_app/screens/authenticate/sign_up.dart';
import 'package:cooking_app/view_models/cooking_user_view_model.dart';
import 'package:cooking_app/view_models/provider_viewmodel.dart';
import 'package:cooking_app/widgets/authentication_widgets/signin_widgets/sign_form.dart';
import 'package:cooking_app/widgets/authentication_widgets/signin_widgets/social.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/widgets/shared/roundedbutton.dart';
import 'package:cooking_app/view_models/provider_viewmodel.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderData(),
      child: MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    Provider.of<ProviderData>(context).data,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff012160)),
                  ),
                  MenuCategories(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference test = FirebaseFirestore.instance.collection("test");
    return FutureBuilder(
      future: test.doc("DGpTcoD9FnkyYwXaGhzD").get(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            DocumentSnapshot menu = snapshot.data.documents[index];
            return ListTile(
              leading: Image.network(menu['image']),
            );
          },
        );
      },
    );
  }
}
