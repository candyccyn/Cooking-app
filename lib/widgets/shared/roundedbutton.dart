import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Color(0xFFFFB448),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20, fontFamily: "Century Gothic", color: Color(0xff091D67)),
          )),
    );
  }
}
