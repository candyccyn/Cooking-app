import 'package:cooking_app/screens/profile/edit_profile.dart';
import 'package:cooking_app/services/user_detail.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatefulWidget {
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      //   color: Colors.green,
      height: size.height * 0.35,
      child: Center(
        child: Stack(fit: StackFit.expand, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: 44,
                  child: Container(
                    decoration: ShapeDecoration(
                        color: Color.fromRGBO(255, 161, 50, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30)))),
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileScreen()));
                      },
                    ),
                  )),
            ],
          ),
          ProfilePicture(),
        ]),
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    UserDetailService userDetailService =
        UserDetailService(menuProvider.getUid);
    userDetailService
        .getBio()
        .then((value) => menuProvider.setProfileDescription(value));

    userDetailService
        .getUserImage()
        .then((value) => menuProvider.setProfileImagePath(value));
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          width: 76,
          height: 76,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                      menuProvider.getProfilePathImage.toString())))),
      SizedBox(height: 15),
      Text(
        menuProvider.getUsername.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Century Gothic',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromRGBO(9, 29, 103, 1)),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          menuProvider.getProfileDescription.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Century Gothic',
              color: Color.fromRGBO(9, 29, 103, 1)),
        ),
      ),
    ]);
  }
}
