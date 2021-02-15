import 'package:cooking_app/screens/authenticate/sign_form.dart';
import 'package:cooking_app/screens/authenticate/social.dart';
import 'package:cooking_app/screens/authenticate/signup_screen.dart';
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFFFF7643),
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SignForm(),
              RaisedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xFFFF7643),
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
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ? ",
                    style: TextStyle(fontSize: 20),
                  ),
                  GestureDetector(
                      onTap: () {},
                      //=>Navigator.pushNamed(context, SignUpScreen.routeName),
                      child: Text("Sign up ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFFF7643),
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ],
          ),
        ));
  }
}
