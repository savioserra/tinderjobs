import 'package:flutter/material.dart';

class JobSearch extends StatelessWidget {
  static final routeName = "/jobsearch";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 154.0,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.1,
                0.9,
              ],
              colors: [
                Color(0xFF373737),
                Color(0xFF050505),
              ],
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Empresa",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "Vaga",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Container(
                    alignment: Alignment.center,
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 4,
                            offset: Offset(1, 1),
                          )
                        ]),
                    child: ClipOval(
                      child: Image.network(
                        "https://www.designevo.com/res/templates/thumb_small/blue-and-green-circular-fish-company.png",
                        fit: BoxFit.contain,
                      ),
                    )),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey[100],
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              children: [
                Content(
                  headerTitle: "Descrição",
                  body:
                      """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
                ),
                Content(
                  headerTitle: "Competências",
                  body:
                      """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
                ),
                Content(
                  headerTitle: "Descrição",
                  body:
                      """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 60.0,
          width: double.infinity,
          color: Colors.black,
        ),
      ],
    );
  }
}

class Content extends StatelessWidget {
  final String headerTitle;
  final String body;

  Content({@required this.body, @required this.headerTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        // height: 200.0,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            )
          ],
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headerTitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
                fontFamily: "Montserrat",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                body,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
