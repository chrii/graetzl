import 'package:flutter/material.dart';
import 'package:graetzl/mixins/device_mixins.dart';

import '../widgets/login/mail_login_field.dart';

class LoginRoute extends StatelessWidget with DeviceSpecificMedia {
  build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Login'),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: deviceHeight(context, appBar) * 0.25,
              child: Stack(
                children: <Widget>[
                  Image(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/images/mainPhoto.png"),
                  ),
                  Positioned(
                    bottom: 10.0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      color: Colors.black45,
                      child: Text(
                        'Bitte loggen Sie sich ein',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: deviceHeight(context, appBar) * 0.75,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: MailLoginField(),
            ),
          ],
        ),
      ),
    );
  }
}
