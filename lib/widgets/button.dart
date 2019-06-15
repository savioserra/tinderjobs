import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobtinder/styles/colors.dart';

class Button extends StatelessWidget {
  Button({this.title, this.icon, this.onTap});

  final VoidCallback onTap;
  final String title;
  final Icon icon;

  final BorderRadius borderRadius = BorderRadius.all(Radius.circular(10));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: this.borderRadius,
        onTap: this.onTap,
        highlightColor: Pallete.lemonGreen,
        child: Container(
          width: 150,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: this.borderRadius,
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                String.fromCharCode(this.icon.icon.codePoint),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: this.icon.icon.fontFamily,
                    package: this.icon.icon.fontPackage),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  this.title,
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Abel", fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
