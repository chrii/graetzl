import 'package:flutter/material.dart';
import 'package:graetzl/mixins/device_mixins.dart';
import 'package:graetzl/widgets/login/registration_field.dart';

class RegistrationRoute extends StatelessWidget with DeviceSpecificMedia {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Login'),
    );

    return WillPopScope(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("Registrieren"),
        ),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        color: Colors.black45,
                        child: Text(
                          '',
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
                child: RegistrationField(),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () => Navigator.of(context).pushNamed("/category"),
    );
  }
}
