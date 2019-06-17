import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:jobtinder/styles/pallete.dart';
import 'package:jobtinder/widgets/rating.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Body(),
        DrawerItem(
          title: "Sair",
          onTap: () => handleLogout(context),
        ),
      ],
    );
  }

  void handleLogout(BuildContext context) async {
    await SharedPreferences.getInstance()
      ..remove('user-token');

    await precacheImage(
        AssetImage("assets/images/login_background.jpg"), context);

    Navigator.of(context).pushReplacementNamed('/login');
  }
}

class Header extends StatelessWidget {
  Header();

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
          ProfilePicture(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Rating(rating: 4.2),
          ),
          ProfileName(),
        ],
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
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

class ProfileName extends StatelessWidget {
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

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(color: Color(0xFFFFF)),
        child: Column(
          children: [
            DrawerItem(
              title: "Perfil",
              onTap: () {},
            ),
            DrawerItem(
              title: "Buscar",
              onTap: () {},
            ),
            DrawerItem(
              title: "Combinações",
              onTap: () {},
            ),
            DrawerItem(
              title: "Depoimentos",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const DrawerItem({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 30.0),
      title: Text(this.title, style: TextStyle(fontFamily: "Montserrat")),
      onTap: onTap,
    );
  }
}
