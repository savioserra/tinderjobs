import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tinderjobs/core/models/user.dart';
import 'package:tinderjobs/core/providers/persistence.dart';
import 'package:tinderjobs/core/providers/setup.dart';
import 'package:tinderjobs/ui/screens/job_search/job_search.dart';
import 'package:tinderjobs/ui/screens/login/login.dart';

class SplashModel extends ChangeNotifier {
  final _persistenceService = Injection.locate<PersistenceService>();
  final _user = Injection.locate<User>();

  static const int splashDuration = 1;

  SplashModel({BuildContext context}) {
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

        _user.copy(User.fromJson(data["user"]));

        await precacheImage(NetworkImage(_user.avatarUrl), context);
        Navigator.of(context).pushReplacementNamed(JobSearch.routeName);
      }
    });
  }
}
