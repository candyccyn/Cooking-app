import 'package:cooking_app/widgets/edit_profile_widget/edit_profile_header.dart';
import 'package:cooking_app/widgets/shared/roundedbutton.dart';
import 'package:flutter/material.dart';

class EditProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  child: buildEditUsernameFormField(),
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
                  child: Container(height: 130, child: buildBioFormField()),
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
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style:
                              TextStyle(fontFamily: 'Century Gothic',
                        fontWeight: FontWeight.bold,fontSize: 17, color: Color(0xffF091D67)),
                        )),
                  ),

                  //  RoundedButton(
                  //         text: "Save",
                  //         press: () {

                  //         },
                  //       ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

TextFormField buildEditUsernameFormField() {
  return TextFormField(
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

TextFormField buildBioFormField() {
  return TextFormField(
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
