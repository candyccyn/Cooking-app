import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

class TimerScreen extends StatefulWidget {
  static String routeName = "/timer";
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with SingleTickerProviderStateMixin {
  TimerController _timerController;
  TimerStyle _timerStyle = TimerStyle.ring;
  TimerProgressIndicatorDirection _progressIndicatorDirection =
      TimerProgressIndicatorDirection.clockwise;
  TimerProgressTextCountDirection _progressTextCountDirection =
      TimerProgressTextCountDirection.count_down;

  final FirebaseFirestore fb = FirebaseFirestore.instance;

  @override
  void initState() {
    _timerController = TimerController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        textTheme: TextTheme(
            headline6: TextStyle(color: Color(0xff091D67), fontSize: 18)),
        title: Text(
          "Steps " + "1" + "/" + "6",
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: FutureBuilder(
                future: getImage(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Image.network(snapshot.data.docs[0].data()["image"],
                        fit: BoxFit.fill);
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Text("No data");
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                // color: Colors.pink,
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    text: "1. Boil Tok pok ki for ",
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
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => _setProgressIndicatorDirection(
                            TimerProgressIndicatorDirection.counter_clockwise),
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

  Future<QuerySnapshot> getImage() {
    return fb.collection("test").get();
  }
}
