import 'package:flutter/material.dart';
import 'package:jobtinder/styles/fonts.dart';
import 'package:jobtinder/utils/font_icons.dart';

class JobSearch extends StatefulWidget {
  static final routeName = "/jobsearch";

  @override
  JobSearchState createState() => JobSearchState();
}

class JobSearchState extends State<JobSearch> {
  bool likeClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF373737), Color(0xFF2a2a2a), Color(0xFF1e1e1e)],
          stops: [0.0, 0.7, 1.0],
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 154.0,
            width: double.infinity,
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
                          child: Fonts.montserrat(
                            "Empresa",
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),
                        Fonts.montserrat(
                          "Vaga",
                          color: Colors.white,
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
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(1, 1),
                        )
                      ],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        "https://www.designevo.com/res/templates/thumb_small/blue-and-green-circular-fish-company.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                  TagsContainer(
                    tags: [
                      "Tecnologia da Informação",
                      "Saúde",
                      "HomeOffice",
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60.0,
            width: double.infinity,
            color: const Color(0xFF191919),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: IconFont.left_open_mini,
                    onTap: () {},
                  ),
                  IconButton(
                    icon: likeClicked ? Icons.favorite : Icons.favorite_border,
                    onTap: () => setState(() => likeClicked = !likeClicked),
                  ),
                  IconButton(
                    icon: IconFont.right_open_mini,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  IconButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class TagsContainer extends StatelessWidget {
  final List<String> tags;

  TagsContainer({this.tags});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Wrap(
        children: tags.map((t) => Tag(text: t, onTap: () {})).toList(),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  Tag({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          splashColor: Colors.white,
          onTap: onTap,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            child: Fonts.montserrat(text, color: Colors.white),
          ),
        ),
      ),
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
      padding: const EdgeInsets.all(20.0),
      child: Container(
        // height: 200.0,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Fonts.montserrat(
              headerTitle,
              color: Colors.grey,
              fontSize: 18.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Fonts.montserrat(
                body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
