import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

class TimerScreen extends StatefulWidget {
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
      body: Center(
          child: Column(
        children: <Widget>[
          FutureBuilder(
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
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "1.  Boil Tok pok ki for 10 minutes",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: SimpleTimer(
              duration: const Duration(seconds: 600),
              controller: _timerController,
              timerStyle: _timerStyle,
              onStart: handleTimerOnStart,
              onEnd: handleTimerOnEnd,
              valueListener: timerValueChangeListener,
              backgroundColor: Colors.grey,
              progressIndicatorColor: Colors.green,
              progressIndicatorDirection: _progressIndicatorDirection,
              progressTextCountDirection: _progressTextCountDirection,
              progressTextStyle: TextStyle(color: Colors.black),
              strokeWidth: 5,
            ),
          )),
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
                            style: TextStyle(color: Colors.white)),
                        color: Color.fromRGBO(255, 161, 50, 1),
                      ),
                      FlatButton(
                        onPressed: _timerController.pause,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: const Text("Pause",
                            style: TextStyle(color: Colors.white)),
                        color: Colors.blue,
                      ),
                    ],
                  )
                ],
              )),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                style: const TextStyle(color: Colors.white))),
                        Icon(Icons.navigate_next,
                            size: 18, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      )),
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
