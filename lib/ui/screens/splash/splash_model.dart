import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobtinder/core/models/user.dart';
import 'package:jobtinder/core/services/persistence.dart';
import 'package:jobtinder/ui/screens/job_search/job_search.dart';
import 'package:jobtinder/ui/screens/login/login.dart';

class SplashModel extends ChangeNotifier {
  final PersistenceService _persistenceService;
  final User _user;

  static const int splashDuration = 1;

  SplashModel(this._persistenceService, this._user, BuildContext context) {
    checkCredentials(context);
  }

  void checkCredentials(BuildContext context) async {
    final token = await _persistenceService.token;

    Timer(Duration(seconds: splashDuration), () async {
      if (token == null) {
        await precacheImage(
          AssetImage("assets/images/login_background.jpg"),
          context,
        );

        Navigator.of(context).pushReplacementNamed(Login.routeName);
      } else {
        var data = await _persistenceService.data;

        _user.fromJson(data);

        await precacheImage(NetworkImage(_user.avatarUrl), context);
        Navigator.of(context).pushReplacementNamed(JobSearch.routeName);
      }
    });
  }
}
