import 'package:authentication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:authentication/services/validator.dart';
import 'package:authentication/widgets/custom_text_form_field.dart';
import 'package:authentication/widgets/shadow_button.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;
  String _password;
  bool _showSpinner = false;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: Column(
                  children: <Widget>[
                    CustomTextFormField(
                      onSaved: (value) {
                        _email = value;
                      },
                      validator: EmailValidator.validate,
                      keyboardType: TextInputType.emailAddress,
                      hint: 'Enter your email.',
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    CustomTextFormField(
                      onSaved: (value) {
                        _password = value;
                      },
                      validator: (value) => value.isEmpty ? '*Required' : null,
                      obscure: true,
                      hint: 'Enter your password.',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              ShadowButton(
                title: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () {
                  _validateLogin();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateLogin() async {
    final FormState form = _formKey.currentState;

    if (_formKey.currentState.validate()) {
      form.save();
      setState(() {
        _showSpinner = true;
      });

      final user = await Provider.of<AuthService>(context, listen: false)
          .signInWithEmailAndPassword(_email, _password);

      if (user is String) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                elevation: 5.0,
                title: Text('Login Error'),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                content: Container(
                  child: Text(user),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      } else if (user != null) {
        Navigator.pop(context);
      }
      setState(() {
        _showSpinner = false;
      });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
