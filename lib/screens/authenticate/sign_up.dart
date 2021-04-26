import 'package:cooking_app/widgets/authentication_widgets/signup_widgets/signup_form.dart';

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName="/sign_up";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:70),
              Text("Sign up",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: "Century Gothic",color:Color(0xff012160)),),
              SizedBox(height:30),
              Text("Complete your detail or continue with social media",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Century Gothic",),),
              SizedBox(height:30),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
