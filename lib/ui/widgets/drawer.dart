import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jobtinder/core/models/user.dart';
import 'package:jobtinder/ui/screens/login.dart';
import 'package:jobtinder/ui/styles/fonts.dart';
import 'package:jobtinder/ui/styles/pallete.dart';
import 'package:jobtinder/ui/widgets/rating.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Column(
      children: [
        Header(user: user),
        Body(user: user),
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

    Navigator.of(context).pushReplacementNamed(Login.routeName);
  }
}

class Header extends StatelessWidget {
  final User user;

  Header({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.9],
          colors: [Pallete.drawerLightGray, Pallete.drawerDarkGray],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfilePicture(
            avatarUrl: user.avatarUrl,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Rating(rating: user.rating),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Fonts.montserrat(
              user.email,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  final String avatarUrl;

  ProfilePicture({this.avatarUrl});

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
          avatarUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final User user;

  Body({this.user});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(color: Color(0xFFFFF)),
        child: Column(
          children: [
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
