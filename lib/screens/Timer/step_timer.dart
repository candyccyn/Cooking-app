import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/screens/recipe_detail/recipeDetailPage.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_timer/simple_timer.dart';

class TimerScreen extends StatefulWidget {
  static String routeName = "/timer";

  final int currentStep;
  const TimerScreen({
    Key key,
    this.currentStep,
  }) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState(this.currentStep);
}

class _TimerScreenState extends State<TimerScreen>
    with SingleTickerProviderStateMixin {
  TimerController _timerController;
  TimerStyle _timerStyle = TimerStyle.ring;
  TimerProgressIndicatorDirection _progressIndicatorDirection =
      TimerProgressIndicatorDirection.clockwise;
  TimerProgressTextCountDirection _progressTextCountDirection =
      TimerProgressTextCountDirection.count_down;

  int currentStep = 0;
  _TimerScreenState(
    this.currentStep,
  );

  //final FirebaseFirestore fb = FirebaseFirestore.instance;

  @override
  void initState() {
    _timerController = TimerController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        textTheme: TextTheme(
            headline6: TextStyle(color: Color(0xff091D67), fontSize: 18)),
        title: Text(
          "Steps " +
              this.currentStep.toString() +
              "/" +
              menuProvider.getStepList.length.toString(),
          style: TextStyle(
              fontFamily: 'Century Gothic',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color.fromRGBO(9, 29, 103, 1)),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xffFFA132),
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(menuProvider.getMenuImagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                // color: Colors.pink,
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    text: menuProvider.getStepList[currentStep - 1].text
                        .toString(),
                    style: TextStyle(
                        fontFamily: 'Century Gothic',
                        fontSize: 16,
                        color: Color.fromRGBO(9, 29, 103, 1)),
                    children: <TextSpan>[
                      TextSpan(
                          text: "10 minutes",
                          style: TextStyle(
                              fontFamily: 'Century Gothic',
                              fontSize: 16,
                              color: Color.fromRGBO(255, 149, 24, 0.89))),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // margin: EdgeInsets.symmetric(vertical: 10),
              width: 120,
              height: 120,
              child: SimpleTimer(
                duration: const Duration(seconds: 600),
                controller: _timerController,
                timerStyle: _timerStyle,
                onStart: handleTimerOnStart,
                onEnd: handleTimerOnEnd,
                valueListener: timerValueChangeListener,
                backgroundColor: Colors.grey,
                progressIndicatorColor: Color.fromRGBO(255, 161, 50, 1),
                progressIndicatorDirection: _progressIndicatorDirection,
                progressTextCountDirection: _progressTextCountDirection,
                progressTextStyle: TextStyle(
                    fontFamily: 'Century Gothic',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(33, 60, 116, 1)),
                strokeWidth: 5,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          onPressed: _timerController.start,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text("Start",
                              style: TextStyle(
                                  fontFamily: 'Century Gothic',
                                  color: Colors.white)),
                          color: Color.fromRGBO(255, 161, 50, 1),
                        ),
                        // FlatButton(
                        //   onPressed: _timerController.pause,
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(15)),
                        //   child: const Text("Pause",
                        //       style: TextStyle(
                        //           fontFamily: 'Century Gothic',
                        //           color: Colors.white)),
                        //   color: Colors.blue,
                        // ),
                      ],
                    )
                  ],
                )),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 30),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        // onPressed: () => _setProgressIndicatorDirection(
                        //     TimerProgressIndicatorDirection.counter_clockwise),
                        onPressed: () => {
                          if (this.currentStep <
                              menuProvider.getStepList.length)
                            {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          new TimerScreen(currentStep: 2)))
                            }
                          // else
                          //   {
                          //     Navigator.popUntil(
                          //         context, ModalRoute.withName("/recipe"))
                          //   }
                        },
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Flexible(
                                child: const Text("Next Step",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontFamily: 'Century Gothic',
                                        color: Colors.white))),
                            Icon(Icons.navigate_next,
                                size: 18, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  void _setCountDirection(TimerProgressTextCountDirection countDirection) {
    setState(() {
      _progressTextCountDirection = countDirection;
    });
  }

  void _setProgressIndicatorDirection(
      TimerProgressIndicatorDirection progressIndicatorDirection) {
    setState(() {
      _progressIndicatorDirection = progressIndicatorDirection;
    });
  }

  void _setStyle(TimerStyle timerStyle) {
    setState(() {
      _timerStyle = timerStyle;
    });
  }

  void timerValueChangeListener(Duration timeElapsed) {}

  void handleTimerOnStart() {
    print("timer has just started");
  }

  void handleTimerOnEnd() {
    print("timer has ended");
  }
}
