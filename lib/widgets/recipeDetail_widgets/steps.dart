import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  const Steps({
    Key key,
    this.description,
    this.time,
  }) : super(key: key);

  final String description, time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        // decoration: BoxDecoration(color: Colors.green),
        constraints: BoxConstraints(
          maxHeight: double.infinity,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: description,
                style: TextStyle(
                    fontSize: 15, color: Color.fromRGBO(9, 29, 103, 1)),
                children: <TextSpan>[
                  TextSpan(
                      text: time,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(255, 149, 24, 0.89))),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
