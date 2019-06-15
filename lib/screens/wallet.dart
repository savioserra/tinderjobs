import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobtinder/styles/colors.dart';
import 'package:jobtinder/widgets/button.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          textDirection: TextDirection.ltr,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 54, bottom: 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.5, 1],
                    colors: [
                      Pallete.green,
                      Pallete.lemonGreen,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 145,
                      height: 145,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        "R\$ 25.16",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Abel",
                            fontSize: 30.0,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          textDirection: TextDirection.ltr,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                color: Pallete.lemonGreen,
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                        title: "Adicionar",
                        onTap: () {},
                        icon: Icon(
                          FontAwesomeIcons.piggyBank,
                          color: Colors.white,
                          size: 20.0,
                        )),
                    Button(
                        title: "Retirar",
                        onTap: () {},
                        icon: Icon(
                          FontAwesomeIcons.moneyBill,
                          color: Colors.white,
                          size: 20.0,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
