import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as Math;

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
            Color(0xFF373737),
            Color(0xFF050505),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ProfilePicture(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: _Rating(rating: 4.2),
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
        color: Colors.white,
        border: Border.all(
          color: Color(0xFFFFFFFF),
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

class _Rating extends StatelessWidget {
  final double rating;

  _Rating({this.rating});

  @override
  Widget build(BuildContext context) {
    var stars = <_StarRating>[];

    for (var i = 1; i < 6; i++) {
      stars.add(_StarRating(active: this.rating >= i, size: 20.0));
    }

    return Container(
      height: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: stars,
      ),
    );
  }
}

class _StarRating extends StatelessWidget {
  final double size;
  final bool active;

  _StarRating({@required this.size, this.active = true});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _StarPainter(active: this.active),
      size: Size(
        this.size,
        this.size,
      ),
    );
  }
}

class _StarPainter extends CustomPainter {
  final Color fillColor;
  final bool active;

  _StarPainter({
    @required this.active,
    this.fillColor = const Color(0xFFDDCE46),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = this.active ? this.fillColor : Colors.white;

    var path = Path();

    double mid = size.width / 2;
    double min = Math.min(size.width, size.height);
    double half = min / 2;

    mid = mid - half;

    path.moveTo(mid + half * 0.5, half * 0.84);
    path.lineTo(mid + half * 1.5, half * 0.84);
    path.lineTo(mid + half * 0.68, half * 1.45);
    path.lineTo(mid + half * 1.0, half * 0.5);
    path.lineTo(mid + half * 1.32, half * 1.45);
    path.lineTo(mid + half * 0.5, half * 0.84);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _ProfileName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,
          ),
          text: "Danielle",
          children: [
            TextSpan(
              text: " Hoffman",
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
        // color: Color(0xFF333333),
        color: Color(0xFFFFF),
      )),
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
