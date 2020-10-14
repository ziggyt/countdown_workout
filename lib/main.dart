import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(NeumorphicApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.top,
        depth: 20,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      )));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Timer timer;

  int targetSeconds = 10;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (targetSeconds > 0) {
          targetSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[100],
        title: Text(
          'Workout Countdown',
          style: TextStyle(color: Colors.grey.shade800),
        ),
        centerTitle: true,
        elevation: 20,
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
            Text(
              targetSeconds.toString(),
              style: TextStyle(fontSize: 70, color: Colors.grey.shade500),
            ),
            NeumorphicButton(
                margin: EdgeInsets.only(top: 12),
                onPressed: () {},
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                  //border: NeumorphicBorder()
                ),
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: NeumorphicText("Start timer",
                    style: NeumorphicStyle(
                      depth: 4, //customize depth here
                      color: Colors.black, //customize color here
                    ),
                    textStyle: NeumorphicTextStyle(
                      fontSize: 18, //customize size here
                    )))
          ],
        ),
      ),
    );
  }
}
