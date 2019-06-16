import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jobtinder/styles/pallete.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  final int splashDuration = 2;

  startTimer() async {
    return Timer(Duration(seconds: splashDuration), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Pallete.drawerLightGray,
            Pallete.drawerDarkGray,
          ],
          radius: .9,
        ),
      ),
      child: Container(
        height: 30.0,
        width: 30.0,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Pallete.yellow),
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
