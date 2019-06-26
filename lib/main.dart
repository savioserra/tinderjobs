import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jobtinder/core/models/user.dart';
import 'package:jobtinder/core/providers/setup.dart' as Providers;
import 'package:jobtinder/ui/screens/job_search/job_search.dart';
import 'package:jobtinder/ui/screens/login.dart';
import 'package:jobtinder/ui/screens/splash.dart';
import 'package:jobtinder/ui/widgets/drawer.dart';

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
      child: ChangeNotifierProvider(
        builder: (context) => User(),
        child: MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: Splash(),
                ),
            '/login': (context) => Scaffold(
                  body: Login(),
                ),
            '/jobsearch': (context) => Scaffold(
                  drawer: Drawer(child: AppDrawer()),
                  body: JobSearch(),
                ),
          },
        ),
      ),
    );
  }
}
