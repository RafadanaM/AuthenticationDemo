import 'package:flutter/material.dart';
import 'package:authentication/screens/home_screen.dart';
import 'package:authentication/screens/login_screen.dart';
import 'package:authentication/screens/register_screen.dart';
import 'package:authentication/screens/welcome_screen.dart';
import 'package:authentication/screens/wrapper.dart';
import 'package:authentication/services/auth.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AuthService(),
      child: MaterialApp(
        title: 'Authentication Demo',
        initialRoute: Wrapper.routeName,
        routes: {
          Wrapper.routeName: (context) => Wrapper(),
          Home.routeName: (context) => Home(),
          Welcome.routeName: (context) => Welcome(),
          Register.routeName: (context) => Register(),
          Login.routeName: (context) => Login(),
        },
      ),
    );
  }
}
