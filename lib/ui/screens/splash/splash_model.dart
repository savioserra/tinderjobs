import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobtinder/core/models/user.dart';
import 'package:jobtinder/core/services/persistence.dart';
import 'package:jobtinder/ui/screens/job_search/job_search.dart';
import 'package:jobtinder/ui/screens/login.dart';

class SplashModel extends ChangeNotifier {
  final PersistenceService persistenceService;
  final User user;

  static const int splashDuration = 1;

  SplashModel(this.persistenceService, this.user, BuildContext context) {
    checkCredentials(context);
  }

  void checkCredentials(BuildContext context) async {
    final token = await persistenceService.token;

    Timer(Duration(seconds: splashDuration), () async {
      if (token == null) {
        await precacheImage(
          AssetImage("assets/images/login_background.jpg"),
          context,
        );

        Navigator.of(context).pushReplacementNamed(Login.routeName);
      } else {
        var data = await persistenceService.data;

        user
          ..email = data["me"]["email"]
          ..avatarUrl = data["me"]["avatarUrl"];

        await precacheImage(NetworkImage(user.avatarUrl), context);
        Navigator.of(context).pushReplacementNamed(JobSearch.routeName);
      }
    });
  }
}
