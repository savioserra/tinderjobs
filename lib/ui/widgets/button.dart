import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tinderjobs/ui/styles/pallete.dart';

class Button extends StatelessWidget {
  final Widget child;

  final bool loading;
  final bool outline;

  final VoidCallback onTap;

  final BorderRadius borderRadius;
  final LinearGradient gradient;

  final Color color;
  final Color borderColor;
  final Color splashColor;

  Button({
    @required this.child,
    @required this.onTap,
    this.loading = false,
    this.outline = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    this.color = Colors.black,
    this.borderColor = Colors.white,
    this.splashColor = Colors.white,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    assert(color != null || gradient != null);

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: splashColor,
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: borderRadius,
              color: gradient != null ? null : color,
              gradient: gradient),
          child: loading ? CircularProgress() : child,
        ),
      ),
    );
  }
}

class CircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.0,
      width: 15.0,
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Pallete.yellow),
        strokeWidth: 1.0,
      ),
    );
  }
}
