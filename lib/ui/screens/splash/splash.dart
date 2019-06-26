import 'package:jobtinder/ui/screens/splash/splash_model.dart';
import 'package:jobtinder/ui/styles/pallete.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const routeName = "/splash";

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashModel>.value(
      value: SplashModel(
        Provider.of(context),
        Provider.of(context),
        context,
      ),
      child: Consumer<SplashModel>(
        builder: (context, model, child) => Container(
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
            ),
      ),
    );
  }
}
