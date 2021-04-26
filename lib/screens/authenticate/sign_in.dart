import 'package:cooking_app/screens/authenticate/sign_up.dart';
import 'package:cooking_app/screens/home/home.dart';
import 'package:cooking_app/screens/profile/profile.dart';
import 'package:cooking_app/services/user_detail.dart';
import 'package:cooking_app/view_models/cooking_user_view_model.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/view_models/navigaition_bar_provider.dart';
// import 'package:cooking_app/view_models/provider_viewmodel.dart';
import 'package:cooking_app/widgets/authentication_widgets/signin_widgets/sign_form.dart';
import 'package:cooking_app/widgets/authentication_widgets/signin_widgets/social.dart';
import 'package:cooking_app/screens/profile/profile.dart';
import 'package:cooking_app/widgets/navigate_component.dart';
import 'package:cooking_app/widgets/shared/roundedbutton.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MenuProvider(),
        child: MaterialApp(
          home: SignUpComponent(),
        ));
  }
}

class SignUpComponent extends StatelessWidget {
  var vmCooking = CookingUserViewModel();
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    "Sign in",
                    style: TextStyle( fontFamily: "Century Gothic",
                      fontSize: 30,
                      color: Color(0xFF012060),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Sign in email and password \nor continue with social media",
                    textAlign: TextAlign.center,style: TextStyle( fontFamily: "Century Gothic",),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SignForm(),
                  RoundedButton(
                    text: "Login",
                    press: () async {
                      await (vmCooking.signInEmail(
                          "oranichbest@gmail.com", "abc123"));
                      menuProvider.setUid(vmCooking.uid);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChangeNotifierProvider<NavigationBarProvider>(
                                    child: MyStatefulWidget(),
                                    create: (BuildContext context) =>
                                        NavigationBarProvider(),
                                  )));
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Social(
                        icon: "assets/icons/google.svg",
                        press: () async {
                          await vmCooking.signInGoogle();
                        },
                      ),
                      Social(
                        icon: "assets/icons/facebook.svg",
                        press: () async {
                          await vmCooking.signInFacebook();
                        },
                      ),
                      Social(
                        icon: "assets/icons/twitter.svg",
                        press: () async {
                          await vmCooking.signInTwitter();
                        },
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
                        style: TextStyle( fontFamily: "Century Gothic",fontSize: 15),
                      ),
                      GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, SignUpScreen.routeName),
                          child: Text("Sign up ",
                              style: TextStyle(
                                 fontFamily: "Century Gothic",
                                  fontSize: 15,
                                  color: Color(0xFFFFA925),
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  async(Future signInEmail) {}
}
