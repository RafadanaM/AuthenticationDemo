import 'package:authentication/screens/home_screen.dart';
import 'package:authentication/screens/login_screen.dart';
import 'package:authentication/screens/register_screen.dart';
import 'package:authentication/screens/welcome_screen.dart';
import 'package:authentication/screens/wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Wrapper.routeName,
      routes: {
        Wrapper.routeName: (context) => Wrapper(),
        Home.routeName: (context) => Home(),
        Welcome.routeName: (context) => Welcome(),
        Register.routeName: (context) => Register(),
        Login.routeName: (context) => Login(),
      },
    );
  }
}
