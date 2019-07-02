import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tinderjobs/core/models/job.dart';
import 'package:tinderjobs/core/providers/job.dart';
import 'package:tinderjobs/core/providers/setup.dart';
import 'package:tinderjobs/core/view_models/login.dart';
import 'package:tinderjobs/ui/styles/fonts.dart';

class Jobs extends StatefulWidget {
  static const routeName = "/jobs";

  @override
  JobsState createState() => JobsState();
}

class JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Injection.locate<JobService>(),
      child: Consumer<JobService>(builder: (context, model, child) {
        if (model.jobs.isEmpty) {
          return EmptyState(
            refresh: model.refresh,
          );
        }

        var job = model.jobs.first;
        return JobOffer(
          job: job,
          onLike: () => model.like(job),
          inactive: model.status == Status.processing,
        );
      }),
    );
  }
}

class EmptyState extends StatelessWidget {
  static const statusBarOffset = 26.0;
  final VoidCallback refresh;

  EmptyState({@required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: statusBarOffset,
          width: double.infinity,
          color: Colors.black,
        ),
        Expanded(
          child: RefreshIndicator(
            color: Colors.black,
            onRefresh: refresh,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height - statusBarOffset,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.grey,
                        size: 30.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Fonts.montserrat(
                        "Oops!\nNenhuma vaga encontrada no momento.",
                        color: Colors.grey,
                        align: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class JobOffer extends StatelessWidget {
  final Job job;
  final bool inactive;
  final VoidCallback onLike;

  JobOffer({this.job, this.onLike, this.inactive = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
        ),
        AbsorbPointer(
          absorbing: inactive,
          child: IgnorePointer(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              color: inactive ? Colors.black54 : Colors.transparent,
            ),
          ),
        )
      ],
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
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 20.0),
          children: [
            Session(
              title: "Informações",
              child: AdditionalInfo(job: job),
            ),
            Session(
              title: "Descrição",
              child: DescriptionCard(text: job.description),
            ),
            TagsContainer(tags: job.tags),
          ],
        ),
      ),
    );
  }
}

class AdditionalInfo extends StatelessWidget {
  final Job job;

  const AdditionalInfo({Key key, this.job}) : super(key: key);

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
            info: job.remuneration.toStringAsFixed(2),
          ),
          InfoItem(
            iconData: FontAwesomeIcons.calendar,
            info: job.weekDays,
          ),
          InfoItem(
            iconData: FontAwesomeIcons.clock,
            info: "${job.weekHours} h",
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                      job.company.name,
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
                  job.company.avatarUrl,
                  fit: BoxFit.cover,
                  height: 80.0,
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
          child: Center(
            child: Container(
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
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          splashColor: Colors.white,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 6.0,
            ),
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
      width: double.infinity,
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
