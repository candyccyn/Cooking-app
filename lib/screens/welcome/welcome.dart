import 'package:cooking_app/screens/authenticate/sign_in.dart';
import 'package:cooking_app/widgets/shared/roundedbutton.dart';
import 'package:cooking_app/widgets/welcome_widgets/welcome_content.dart';

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName="/welcome";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int current = 0;
  List<Map<String, String>> img = [
    {"text": "welcome", "image": "assets/images/cooking1.png"},
    {"text": "to", "image": "assets/images/cooking2.png"},
    {"text": "cooking", "image": "assets/images/cooking3.png"},
  ];  // TODO move these data into viewmodel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        current = value;
                      });
                    },
                    itemCount: img.length,
                    itemBuilder: (context, index) => WelcomeContent(
                      image: img[index]["image"],
                      text: img[index]["text"],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              img.length, (index) => buildDot(index: index))),
                      Spacer(flex:3),
                      RoundedButton(
                        text:"Get start",
                        press:(){
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                      ),
                      Spacer(flex: 3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: current == index ? Color(0xffFDDD5C) : Color(0xffC4C4C4),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}