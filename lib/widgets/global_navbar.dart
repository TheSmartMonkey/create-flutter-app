import 'package:app/core/constants.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final String? customTitle;
  final Widget child;

  const NavBar({
    Key? key,
    this.customTitle,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(customTitle ?? appTitle),
      ),
      body: child,
    );
  }
}
