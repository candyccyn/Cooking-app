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
            SizedBox(height:50),
            Text("Register account",style: TextStyle(fontSize: 30),),
           
           SizedBox(height:30),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
