import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:jobtinder/styles/colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: [
        Positioned(
          child: Image(
            fit: BoxFit.contain,
            color: Colors.black38,
            colorBlendMode: BlendMode.luminosity,
            image: NetworkImage(
              "https://www.thenation.com/wp-content/uploads/2018/04/soccer-ball-ss-img.jpg",
            ),
          ),
        ),
        Positioned.fill(
          top: 160.0,
          child: Container(
            // margin: EdgeInsets.only(top: -50.0),
            padding: EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
            decoration: BoxDecoration(
              color: Pallete.lemonGreen,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 100.0,
                  spreadRadius: 10.0,
                  offset: Offset(0, -10),
                )
              ],
              gradient: LinearGradient(
                colors: [Pallete.lemonGreen, Pallete.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(60.0),
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Text(
                    "LigaPay",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 40.0,
                        decoration: TextDecoration.none,
                        shadows: [
                          Shadow(
                            color: Colors.black12,
                            offset: Offset(2, 2),
                            blurRadius: 2.0,
                          )
                        ],
                        fontFamily: "Vampiro"),
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextField(iconData: Icons.alternate_email),
                        TextField(iconData: Icons.lock_outline),
                        LoginButton()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 50.0,
      ),
      height: 60.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      alignment: Alignment.center,
      child: Material(
        shadowColor: Colors.transparent,
        color: Colors.transparent,
        child: Container(
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            splashColor: Colors.black12,
            highlightColor: Colors.black26,
            onTap: () {
              Navigator.pushNamed(context, "/wallet");
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black,
                backgroundBlendMode: BlendMode.softLight,
              ),
              height: 60.0,
              child: Text(
                "Login",
                style: TextStyle(
                    fontFamily: "Abel",
                    fontSize: 18.0,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        color: Colors.black26,
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  final IconData iconData;

  const TextField({Key key, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(2, 2),
            )
          ]),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(
            this.iconData,
            color: Colors.black54,
            size: 20.0,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
        ),
        style: TextStyle(
          color: Colors.black54,
          decoration: TextDecoration.none,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
