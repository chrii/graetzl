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
  bool _isVaild = true;

  void _validate() =>
      setState(() => _isVaild = EmailValidator.validate(_mailInput.text));

  build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _mailInput,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "E-Mail",
                    errorText: _isVaild
                        ? null
                        : "Die E-Mail Adresse ist nicht korrekt"),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  RaisedButton.icon(
                    elevation: 5.0,
                    //textColor: Theme.of(context).primaryColor,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      _validate();
                      print(_mailInput.text);
                    },
                    icon: Icon(Icons.send),
                    label: Text("Submit"),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {},
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
