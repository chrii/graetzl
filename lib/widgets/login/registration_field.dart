import 'package:flutter/material.dart';

class RegistrationField extends StatelessWidget {
  build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-Mail",
                ),
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
                    onPressed: () {},
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
