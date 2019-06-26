import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Rating extends StatelessWidget {
  final double rating;
  final double size;

  Rating({@required this.rating, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    var stars = <Star>[];

    for (var i = 1; i < 6; i++) {
      stars.add(Star(active: this.rating >= i, size: this.size));
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

class Star extends StatelessWidget {
  final double size;
  final bool active;

  Star({@required this.size, this.active = true});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StarPainter(active: this.active),
      size: Size(
        this.size,
        this.size,
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  final Color fillColor;
  final bool active;

  StarPainter({
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
