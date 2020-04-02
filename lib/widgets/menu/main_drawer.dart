import 'package:flutter/material.dart';
import 'package:graetzl/database/dbmock.dart';
import './menu_elements.dart';
import '../../mixins/device_mixins.dart';

class MainDrawer extends StatelessWidget with DeviceSpecificMedia {
  final List categoryItems;

  void _navigate(BuildContext context) {
    Navigator.of(context).pushNamed("/categories");
  }

  MainDrawer(this.categoryItems);

  build(BuildContext context) {
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
            child: ListTile(
              title: Text("Olaf the Gianslayer"),
              trailing: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                foregroundColor: Colors.white,
                child: Icon(Icons.account_circle),
              ),
            ),
          ),
          Divider(),
          Container(
            child: ListView.builder(
              itemCount: MAIN_MENU.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(MAIN_MENU[index]['title']),
                onTap: () {
                  _navigate(context);
                },
              ),
            ),
            // @TODO: Make this responsive
            height: 400.0,
          ),
        ],
      ),
    );
  }
}
