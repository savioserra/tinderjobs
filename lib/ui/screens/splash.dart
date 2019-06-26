import 'dart:async';
import 'dart:convert';
import 'package:jobtinder/core/models/user.dart';
import 'package:jobtinder/ui/screens/job_search/job_search.dart';
import 'package:jobtinder/ui/screens/login.dart';
import 'package:jobtinder/ui/styles/pallete.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const routeName = "/splash";

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  final int splashDuration = 1;

  void checkCredentials() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString("user");

    Timer(Duration(seconds: splashDuration), () async {
      if (data == null) {
        await precacheImage(
          AssetImage("assets/images/login_background.jpg"),
          context,
        );

        Navigator.of(context).pushReplacementNamed(Login.routeName);
      } else {
        final decodedUser = jsonDecode(data)["login"];

        final user = Provider.of<User>(context)
          ..token = decodedUser["token"]
          ..avatarUrl = decodedUser["user"]["avatarUrl"]
          ..email = decodedUser["user"]["email"]
          ..rating = decodedUser["user"]["rating"];

        await precacheImage(NetworkImage(user.avatarUrl), context);
        Navigator.of(context).pushReplacementNamed(JobSearch.routeName);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Pallete.drawerDarkGray,
      ),
      child: Container(
        height: 30.0,
        width: 30.0,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Pallete.yellow),
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
