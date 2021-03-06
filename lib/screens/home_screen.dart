import 'package:authentication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('HOME'),
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await Provider.of<AuthService>(context, listen: false).signOut();
            },
            icon: Icon(Icons.person),
            label: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
