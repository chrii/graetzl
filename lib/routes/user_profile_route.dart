import 'package:flutter/material.dart';
import 'package:graetzl/models/user_data_model.dart';
import 'package:graetzl/widgets/loading.dart';
import 'package:provider/provider.dart';

class UserProfileRoute extends StatefulWidget {
  _UserProfileRouteState createState() => _UserProfileRouteState();
}

class _UserProfileRouteState extends State<UserProfileRoute> {
  @override
  Widget build(BuildContext context) {
    bool _isLoadingData = true;
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _userData = Provider.of<UserData>(context);

    if (_userData != null) {
      setState(() => _isLoadingData = false);
    }

    //Todo: Renderflex Bug on Loading because its not fullscreen
    return _isLoadingData
        ? Loading()
        : Column(
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
