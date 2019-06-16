import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:jobtinder/graphql/client.dart' as GraphQL;
import 'package:jobtinder/screens/login.dart';
import 'package:jobtinder/screens/splash.dart';
import 'package:jobtinder/widgets/drawer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQL.client,
      child: CacheProvider(
        child: MaterialApp(routes: {
          '/': (context) => Scaffold(body: Splash()),
          '/login': (context) => Scaffold(body: Login()),
          '/home': (context) => Scaffold(drawer: Drawer(child: AppDrawer())),
        }),
      ),
    );
  }
}
