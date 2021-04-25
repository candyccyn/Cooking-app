import 'package:cooking_app/screens/Timer/step_timer.dart';
import 'package:flutter/material.dart';

class ClockButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        //Navigator.pushNamed(context, TimerScreen.routeName)
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new TimerScreen(currentStep: 1)))
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: double.infinity,
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 149, 24, 0.89),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: Text('Clock',
              style: TextStyle(
                fontFamily: 'Century Gothic',
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
