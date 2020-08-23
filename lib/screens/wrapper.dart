import 'package:authentication/models/user.dart';
import 'package:authentication/screens/home_screen.dart';
import 'package:authentication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:authentication/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<AuthService>(context).user,
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          print(snapshot.data);
          return signedIn
              ? Home()
              : Welcome();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
