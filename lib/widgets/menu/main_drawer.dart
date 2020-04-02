import 'package:flutter/material.dart';
import './menu_elements.dart';
import '../../mixins/device_mixins.dart';

class MainDrawer extends StatelessWidget with DeviceSpecificMedia {
  // void _navigate(BuildContext context {
  //   Navigator.of(context).pushNamed("/categories", arguments: {
  //     "title": categoryItems['title'],
  //     "image": categoryItems['mainImage'],
  //     "subtitle": categoryItems['subtitle'],
  //     "tasks": categoryItems['tasksInit']
  //   });
  // }

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
            child: Column(
              children: <Widget>[
                ...MAIN_MENU
                    .map(
                      (item) => ListTile(
                        title: Text(item['title']),
                        onTap: () {
                          print('[NAVIGATOR]' + item.toString());
                          // _navigate(context);
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
            // @TODO: Make this responsive
            height: 400.0,
          ),
        ],
      ),
    );
  }
}
