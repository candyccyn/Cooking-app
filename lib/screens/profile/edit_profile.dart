import 'package:cooking_app/widgets/edit_profile_widget/edit_profile_body.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  static String routeName = "/edit_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.white,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios),
      //     color: Color(0xffFFA132),
      //     iconSize: 20.0,
      //     onPressed: () {
      //        Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: EditProfileBody(),
    );
  }
}
