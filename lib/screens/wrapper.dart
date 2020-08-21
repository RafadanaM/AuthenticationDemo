import 'package:authentication/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    //return either welcome screen or home widget
    return Welcome();
  }
}
