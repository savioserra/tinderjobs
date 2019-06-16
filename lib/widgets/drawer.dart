import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:jobtinder/styles/pallete.dart';
import 'package:jobtinder/widgets/rating.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(),
        _Body(),
        _Footer(),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.1,
            0.9,
          ],
          colors: [
            Pallete.drawerLightGray,
            Pallete.drawerDarkGray,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ProfilePicture(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Rating(rating: 4.2),
          ),
          _ProfileName(),
        ],
      ),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      width: 110.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white70,
          width: 1.0,
        ),
      ),
      child: ClipOval(
        child: Image.network(
          "https://bittaxer.com/wp-content/uploads/2018/03/danielle-profile-bittaxer-300x300.jpg",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _ProfileName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        "Danielle Hoffman",
        style: TextStyle(fontFamily: "Montserrat", color: Colors.white),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(color: Color(0xFFFFF)),
        child: Column(
          children: [
            DrawerItem(title: "Perfil"),
            DrawerItem(title: "Buscar"),
            DrawerItem(title: "Combinações"),
            DrawerItem(title: "Depoimentos"),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;

  const DrawerItem({this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 30.0),
      title: Text(this.title, style: TextStyle(fontFamily: "Montserrat")),
      onTap: () {},
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 30.0),
      title: Text("Sair", style: TextStyle(fontFamily: "Montserrat")),
      onTap: () {},
    );
  }
}
