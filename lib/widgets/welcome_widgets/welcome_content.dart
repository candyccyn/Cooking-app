import 'package:flutter/material.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "Cooking App",
          style: TextStyle(
            color:Color(0xff012060),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text, textAlign: TextAlign.center,),
        Image.asset(
          image,
          height: 320,
          width: 320,
        ),
      ],
    );
  }
}
