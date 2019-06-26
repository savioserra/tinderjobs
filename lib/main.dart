import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jobtinder/core/providers/setup.dart' as Providers;
import 'package:jobtinder/ui/screens/job_search/job_search.dart';
import 'package:jobtinder/ui/screens/login/login.dart';
import 'package:jobtinder/ui/screens/screen.dart';
import 'package:jobtinder/ui/screens/splash/splash.dart';

import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: MaterialApp(
        routes: {
          '/': (context) => Screen(Splash(), disableDrawer: true),
          '/login': (context) => Screen(Login(), disableDrawer: true),
          '/jobsearch': (context) => Screen(JobSearch())
        },
      ),
    );
  }
}
