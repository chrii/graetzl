import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class RegistrationField extends StatefulWidget {
  _RegistrationFieldState createState() => _RegistrationFieldState();
}

class _RegistrationFieldState extends State<RegistrationField> {
  final _emailText = TextEditingController();
  final _passwordText = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                    : "Es gibt ein Problem mit der E-Mail Adresse",
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-Mail",
                ),
                controller: _emailText,
              ),
              TextFormField(
                validator: (val) =>
                    val.length < 8 ? "Password is too short" : null,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
                controller: _passwordText,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  RaisedButton.icon(
                    elevation: 5.0,
                    //textColor: Theme.of(context).primaryColor,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print(
                            "Email: ${_emailText.text} && Password: ${_passwordText.text}");
                      }
                    },
                    icon: Icon(Icons.send),
                    label: Text("Registrieren"),
                  ),
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Zurück"),
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
