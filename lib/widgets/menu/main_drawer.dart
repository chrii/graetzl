import 'package:flutter/material.dart';
import 'package:graetzl/models/user.dart';
import 'package:provider/provider.dart';
import './menu_elements.dart';
import '../../mixins/device_mixins.dart';

class MainDrawer extends StatelessWidget with DeviceSpecificMedia {
  build(BuildContext context) {
    final _user = Provider.of<User>(context);
    final _userTile = MediaQuery.of(context).padding.top + 5;
    final _menuTile = MediaQuery.of(context).size.height;

    print(_userTile);
    print(_menuTile);

    return Drawer(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: _userTile),
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: _user != null
                ? ListTile(
                    title: Text(_user.uid),
                    trailing: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {},
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.account_circle),
                    ),
                  )
                : Text('Anonym'),
          ),
          Divider(),
          Container(
            child: ListTile(
              title: Text("Home"),
              onTap: () => Navigator.of(context).popAndPushNamed("/"),
            ),
          ),
          Divider(),
          Container(
            child: Expanded(
              child: Column(
                children: <Widget>[
                  ...MAIN_MENU
                      .map(
                        (item) => ListTile(
                          title: Text(item['title']),
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed(
                              "/categories",
                              arguments: {
                                "title": item['title'],
                                "image": item['image'],
                                "subtitle": item['subtitle'],
                                "id": item['categoryId']
                              },
                            );
                          },
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            // @TODO: Make this responsive
          ),
        ],
      ),
    );
  }
}
