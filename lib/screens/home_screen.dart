import 'package:authentication/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const String routeName = '/home';

  final AuthService _authService = AuthService();

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
              await _authService.signOut();
            },
            icon: Icon(Icons.person),
            label: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
