import 'package:cooking_app/screens/authenticate/social.dart';
import 'package:cooking_app/view_models/cooking_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  var vmCooking = CookingUserViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign in",
              style: TextStyle(
                color: HexColor("#042E84"),
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: HexColor("#042E84"),
                  ),
                ),
                onPressed: () async {
                    vmCooking.signInAnon();
                    print(vmCooking.uid);
                }),
            SizedBox(
              height: 20.0,
            ),
             Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Social(
                      icon: "assets/icons/google.svg",
                      press: () {},
                    ),
                    Social(
                      icon: "assets/icons/facebook.svg",
                      press: () {},
                    ),
                    Social(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
          ],
        ));
  }
}
