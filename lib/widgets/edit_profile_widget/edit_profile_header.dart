import 'package:cooking_app/widgets/profile_widget/profile_header.dart';
import 'package:flutter/material.dart';

class EditProfileHeader extends StatefulWidget {
  @override
  _EditProfileHeaderState createState() => _EditProfileHeaderState();
}

class _EditProfileHeaderState extends State<EditProfileHeader> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.35,
      child: EditProfilePicture(),
    );
  }
}

class EditProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 76,
        height: 76,
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
      SizedBox(height: 15),
      Text(
        'Change Profile Photo ',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Century Gothic',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xfffFFB448),
             decoration: TextDecoration.underline,),
      ),
     
    ]);
  }
}
