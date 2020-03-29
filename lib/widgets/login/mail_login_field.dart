import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graetzl/services/auth.dart';
import 'package:graetzl/widgets/login/o_auth_button.dart';

class MailLoginField extends StatefulWidget {
  _MailLoginFieldState createState() => _MailLoginFieldState();
}

class _MailLoginFieldState extends State<MailLoginField> {
  final AuthService _auth = AuthService();
  final _mailInput = TextEditingController();
  final _passwordInput = TextEditingController();
  void _routeRegistration(BuildContext context) =>
      Navigator.of(context).pushNamed("/registration");
  final _formKey = GlobalKey<FormState>();
  String error = "";

  build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (val) => EmailValidator.validate(val)
                    ? null
                    : "Etwas stimmt mit der E-MailAdresse nicht",
                controller: _mailInput,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-Mail",
                ),
              ),
              TextFormField(
                validator: (val) =>
                    val.length < 8 ? "Das Password ist zu kurz" : null,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
                controller: _passwordInput,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  RaisedButton.icon(
                    elevation: 5.0,
                    //textColor: Theme.of(context).primaryColor,
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            _mailInput.text, _passwordInput.text);
                        if (result == null) {
                          setState(() {
                            error = "Passwort oder Email Adresse ungültig";
                          });
                        }
                      }
                    },
                    icon: Icon(Icons.send),
                    label: Text("Einloggen"),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () => _routeRegistration(context),
                    child: Text("Registrieren"),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Alternativ",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: <Widget>[
            OAuthButton(
                icon: FaIcon(FontAwesomeIcons.google),
                label: "Google",
                color: Colors.red),
            OAuthButton(
                icon: FaIcon(FontAwesomeIcons.facebook),
                label: "Facebook",
                color: Colors.blue),
            RaisedButton(
              child: Text("Login (Debug)"),
              onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null) {
                  print("Error");
                } else {
                  print('Signed in');
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
