import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class MailLoginField extends StatefulWidget {
  _MailLoginFieldState createState() => _MailLoginFieldState();
}

class _MailLoginFieldState extends State<MailLoginField> {
  final _mailInput = TextEditingController();
  bool _isVaild = true;

  void _validate() {
    setState(() {
      _isVaild = EmailValidator.validate(_mailInput.text);
    });
  }

  build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10.0),
        TextField(
          controller: _mailInput,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: "E-Mail",
              errorText:
                  _isVaild ? null : "Die E-Mail Adresse ist nicht korrekt"),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "Password",
          ),
          obscureText: true,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
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
          ],
        ),
      ],
    );
  }
}
