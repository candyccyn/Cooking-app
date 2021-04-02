import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/services/user_detail.dart';
import 'package:cooking_app/view_models/profile_view_model.dart';
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
    var providerData = Provider.of<ProviderData>(context);
    providerData.setUserDetailService(userId);
    return FutureBuilder<DocumentSnapshot>(
        future: providerData.userDetailService.getUserDetails(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          providerData.showUsername(context, snapshot);
          var text = providerData.textMessage;
          return Text(text);
        });
  }
}
