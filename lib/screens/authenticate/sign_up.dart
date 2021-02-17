import 'package:cooking_app/screens/authenticate/signup_form.dart';
import 'package:flutter/material.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
              child: Column(
          children: [
            SizedBox(height:70),
            Text("Sign up",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Color(0xff012160)),),
            SizedBox(height:30),
           Text("Complete your detail or continue with social media",textAlign: TextAlign.center,),
           SizedBox(height:30),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
