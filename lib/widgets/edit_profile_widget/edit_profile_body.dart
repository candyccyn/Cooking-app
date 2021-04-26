import 'package:cooking_app/services/post_services/user_detail_post.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/widgets/edit_profile_widget/edit_profile_header.dart';
import 'package:cooking_app/widgets/shared/roundedbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    UserDetailPost userDetailPost = UserDetailPost(menuProvider.getUid);
    TextEditingController usernameController = new TextEditingController();
    TextEditingController bioController = new TextEditingController();
    TextEditingController profilePicController = new TextEditingController();
    usernameController.text = menuProvider.getUsername;
    bioController.text = menuProvider.getProfileDescription;
    profilePicController.text = menuProvider.getProfilePathImage;
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            EditProfileHeader(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(
                    'Username',
                    style: TextStyle(
                        color: Color(0xff7C7C7C),
                        fontFamily: 'Century Gothic',
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: buildEditUsernameFormField(
                      usernameController, menuProvider),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(
                    'Bio',
                    style: TextStyle(
                        color: Color(0xff7C7C7C),
                        fontFamily: 'Century Gothic',
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                      height: 130,
                      child: buildBioFormField(bioController, menuProvider)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(
                    'Image url',
                    style: TextStyle(
                        color: Color(0xff7C7C7C),
                        fontFamily: 'Century Gothic',
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: buildEditImagePathFormField(
                      profilePicController, menuProvider),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                style: BorderStyle.solid,
                                color: Color(0xffFFA132))),
                        color: Color(0xfffFFB448),
                        onPressed: () {
                          userDetailPost
                              .updateUsername(usernameController.text);
                          userDetailPost.updateUserBio(bioController.text);
                          userDetailPost
                              .updateUserImage(profilePicController.text);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontFamily: 'Century Gothic',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color(0xffF091D67)),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

TextFormField buildEditUsernameFormField(
    TextEditingController usernameController, MenuProvider menuProvider) {
  return TextFormField(
    controller: usernameController,
    decoration: InputDecoration(
      filled: true,
      fillColor: Color(0xFFFFFE4C4),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFFFE4C4),
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFFFE4C4),
        ),
      ),
    ),
  );
}

TextFormField buildBioFormField(
    TextEditingController bioFormController, MenuProvider menuProvider) {
  return TextFormField(
    controller: bioFormController,
    maxLines: 8,
    decoration: InputDecoration(
      filled: true,
      fillColor: Color(0xFFFFFE4C4),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFFFE4C4),
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFFFE4C4),
        ),
      ),
    ),
  );
}

TextFormField buildEditImagePathFormField(
    TextEditingController profilePicController, MenuProvider menuProvider) {
  return TextFormField(
    controller: profilePicController,
    decoration: InputDecoration(
      filled: true,
      fillColor: Color(0xFFFFFE4C4),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFFFE4C4),
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFFFE4C4),
        ),
      ),
    ),
  );
}
