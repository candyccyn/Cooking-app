import 'package:cooking_app/widgets/edit_profile_widget/edit_profile_body.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  static String routeName = "/edit_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditProfileBody(),
    );
  }
}
