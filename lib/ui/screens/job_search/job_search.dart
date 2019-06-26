import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobtinder/core/models/job.dart';
import 'package:jobtinder/ui/screens/job_search/model.dart';
import 'package:jobtinder/ui/styles/fonts.dart';
import 'package:provider/provider.dart';

class JobSearch extends StatefulWidget {
  static const routeName = "/jobsearch";

  @override
  JobSearchState createState() => JobSearchState();
}

class JobSearchState extends State<JobSearch> {
  // void refresh() {
  //   if (availableJobs.length <= 5) {
  //     setState(() {
  //       getJobsResult = getJobs();
  //     });
  //   }
  // }

  // Future<List<Job>> getJobs() async {
  //   var result = await gqlClient.query(QueryOptions(
  //     document: Query.getJobs,
  //   ));

  //   if (result.data != null) {
  //     var jobs = List<Job>.from(
  //       result.data["me"]["availableJobs"].map((j) => Job(title: j["title"])),
  //     );

  //     availableJobs.addAll(jobs.where((j) => !availableJobs.contains(j)));
  //   }

  //   return availableJobs;
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JobSearchModel>.value(
      value: JobSearchModel(Provider.of(context)),
      child: Consumer<JobSearchModel>(
        builder: (context, model, child) => JobOffer(
              job: model.availableJobs.first,
              onLike: model.getAvailableJobs,
            ),
      ),
    );
  }
}

class JobOffer extends StatelessWidget {
  final Job job;
  final VoidCallback onLike;

  JobOffer({this.job, this.onLike});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF373737),
            Color(0xFF373737),
            Color(0xFF222222),
            Color(0xFF0B0B0B)
          ],
          stops: [0.0, 0.4, 0.8, 1.0],
        ),
      ),
      child: Column(
        children: [
          Header(job: job),
          Body(job: job),
          Footer(onLike: onLike),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  final VoidCallback onLike;

  Footer({this.onLike});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: double.infinity,
      color: const Color(0xFF191919),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: FontAwesomeIcons.ban,
              onTap: () {},
            ),
            IconButton(
              icon: FontAwesomeIcons.heart,
              onTap: onLike,
            )
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final Job job;

  const Body({Key key, this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 20.0),
          children: [
            Session(
              title: "Descrição",
              child: DescriptionCard(
                text:
                    """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
              ),
            ),
            Session(
              title: "Informações",
              child: AdditionalInfo(),
            ),
            TagsContainer(
              tags: ["Tecnologia da Informação", "Saúde", "Home Office"],
            ),
          ],
        ),
      ),
    );
  }
}

class AdditionalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Color(0xFF303030),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(2, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoItem(
            iconData: FontAwesomeIcons.dollarSign,
            info: "3500.00",
          ),
          InfoItem(
            iconData: FontAwesomeIcons.calendar,
            info: "Segunda à Sexta",
          ),
          InfoItem(
            iconData: FontAwesomeIcons.clock,
            info: "40 h",
          ),
          InfoItem(
            iconData: FontAwesomeIcons.mapMarkedAlt,
            info: "Vitória",
          ),
        ],
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final IconData iconData;
  final String info;

  InfoItem({this.iconData, this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(iconData, color: Colors.white, size: 16.0),
          ),
          Fonts.montserrat(info, color: Colors.white),
        ],
      ),
    );
  }
}

class Session extends StatelessWidget {
  Session({this.title, this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Fonts.montserrat(
              title,
              color: Color(0xFF686868),
              fontSize: 18.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final Job job;

  const Header({Key key, this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 154.0,
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
                      "Empresa Ltda.",
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  Fonts.montserrat(
                    job.title,
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
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(2, 1),
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
    );
  }
}

class IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  IconButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(4.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 18.0,
            ),
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
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
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

class DescriptionCard extends StatelessWidget {
  final String text;

  DescriptionCard({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(2, 1),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Fonts.montserrat(
        text,
      ),
    );
  }
}
