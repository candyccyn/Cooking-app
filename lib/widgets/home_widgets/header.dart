import 'package:cooking_app/view_models/navigation_view_model.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    NavigationViewModel navigationVM = NavigationViewModel();

    return Container(
      // decoration: BoxDecoration(color: Colors.green),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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
      ),
    );
  }
}
