import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // decoration: BoxDecoration(color: Colors.pink),
      height: size.height * .15,
      child: Row(
          children: [
            Text(
              'Hi ' + 'username' + ' !\n' + 'Let\'s create your own ',
              style: TextStyle(
                  fontFamily: 'Century Gothic',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromRGBO(9, 29, 103, 1)),
            ),
            Text('\nrecipe',
                style: TextStyle(
                    fontFamily: 'Century Gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromRGBO(255, 149, 24, 0.89))),
          ],
        ),
    );
  }
}