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
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Spacer(),
        Container(
            // color: Colors.green,
            height: size.height * .20,
            child: Image.asset('assets/images/bechef-logo.png')),
        // Text(
        //   "Cooking App",
        //   style: TextStyle(
        //     color: Color(0xff012060),
        //     fontSize: 30,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        Spacer(),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff012060),
            fontSize: 24,
          ),
        ),
        Spacer(),
        Container(
        height: size.height * .35,
          child: Image.asset(image),
        ),
      ],
    );
  }
}
