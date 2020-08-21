import 'package:authentication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:authentication/widgets/custom_text_form_field.dart';
import 'package:authentication/widgets/shadow_button.dart';
import 'package:authentication/services/validator.dart';

class Register extends StatefulWidget {
  static const String routeName = '/registration';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthService _authService = AuthService();
  bool _autoValidate = false;
  bool _showSpinner = false;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
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
              ShadowButton(
                title: 'Register',
                color: Colors.blueAccent,
                onPressed: () {
                  _validateRegister();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateRegister() async {
    final FormState form = _formKey.currentState;
    if (_formKey.currentState.validate()) {
      form.save();

      final user =
          await _authService.createUserWithEmailAndPassword(_email, _password);
      print(user);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
