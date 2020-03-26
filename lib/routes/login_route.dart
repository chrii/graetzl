import 'package:flutter/material.dart';

class LoginRoute extends StatelessWidget {
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Form(
          child: Column(
            children: <Widget>[
              FormField(builder: null),
            ],
          ),
        ),
      ),
    );
  }
}
