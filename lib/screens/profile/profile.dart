import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/services/user_detail.dart';
import 'package:cooking_app/view_models/provider_viewmodel.dart';
import 'package:provider/provider.dart';


import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var userId = Provider.of<ProviderData>(context).data;
    UserDetailService userDetailService = UserDetailService(userId);

    return FutureBuilder<DocumentSnapshot>(
      future: userDetailService.getUserDetails(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Full Name: ${data['username']}");
        }
        return Text("loading");
      },
    );
  }
}
