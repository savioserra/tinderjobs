import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobtinder/ui/widgets/drawer.dart';

class Screen extends StatelessWidget {
  final Widget _widget;
  final bool disableDrawer;

  const Screen(Widget widget, {this.disableDrawer = false}) : _widget = widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: disableDrawer ? null : Drawer(child: AppDrawer()),
      body: _widget,
    );
  }
}
