import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tinderjobs/core/providers/setup.dart';
import 'package:tinderjobs/ui/screens/job_search/job_search.dart';
import 'package:tinderjobs/ui/screens/login/login.dart';
import 'package:tinderjobs/ui/screens/screen.dart';
import 'package:tinderjobs/ui/screens/splash/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black,
    ),
  );

  Injection.setup();

  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Screen(Splash(), disableDrawer: true),
        '/login': (context) => Screen(Login(), disableDrawer: true),
        '/jobsearch': (context) => Screen(JobSearch())
      },
    );
  }
}
