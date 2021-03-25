import 'package:cooking_app/screens/home/home.dart';
import 'package:cooking_app/view_models/welcome_view_model.dart';
import 'package:cooking_app/widgets/shared/roundedbutton.dart';
import 'package:cooking_app/widgets/welcome_widgets/welcome_content.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/welcome";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  WelcomeViewModel welcomeVM = WelcomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        welcomeVM.currentIndex = value;
                      });
                    },
                    itemCount: welcomeVM.getDataLength(),
                    itemBuilder: (context, index) => WelcomeContent(
                      image: welcomeVM.getImg(index),
                      text: welcomeVM.getText(index),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(welcomeVM.getDataLength(),
                              (index) => buildDot(index: index))),
                      Spacer(flex: 3),
                      RoundedButton(
                        text: "Get start",
                        press: () {
                          // Navigator.pushNamed(context, SignInScreen.routeName);
                          Navigator.pushNamed(context, HomeScreen.routeName);
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
          color: welcomeVM.currentIndex == index
              ? Color(0xffFDDD5C)
              : Color(0xffC4C4C4),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
