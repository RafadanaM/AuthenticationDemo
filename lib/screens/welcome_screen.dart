import 'package:authentication/screens/login_screen.dart';
import 'package:authentication/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:authentication/widgets/shadow_button.dart';

class Welcome extends StatefulWidget {
  static const String routeName = '/welcome';

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[],
            ),
            SizedBox(
              height: 48.0,
            ),
            ShadowButton(
              title: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, Login.routeName);
              },
            ),
            ShadowButton(
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, Register.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
