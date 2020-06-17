import 'package:flutter/material.dart';
import 'package:graetzl/models/user_data_model.dart';
import 'package:provider/provider.dart';

class UserProfileRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _userData = Provider.of<UserData>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: _deviceHeight * 0.3,
          padding: EdgeInsets.all(25.0),
          width: double.infinity,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            child: Icon(
              Icons.account_circle,
              size: 150.0,
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ),
        Container(
          height: _deviceHeight * 0.5152,
          child: Card(
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  title: Text("Name:"),
                  subtitle: Text(_userData.name),
                ),
                ListTile(
                  title: Text("E-Mail Adresse:"),
                  subtitle: Text(_userData.email),
                ),
                ListTile(
                  title: Text("Adresse:"),
                  subtitle: Text(_userData.adress),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
