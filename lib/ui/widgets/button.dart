import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobtinder/ui/styles/pallete.dart';

class Button extends StatelessWidget {
  final Widget child;

  final bool loading;
  final bool outline;

  final VoidCallback onTap;

  final BorderRadius borderRadius;

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
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: outline ? Colors.transparent : color,
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
            color: Colors.transparent,
          ),
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
