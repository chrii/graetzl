import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graetzl/database/database_service.dart';
import 'package:graetzl/models/user.dart';
import 'package:graetzl/models/user_data_model.dart';
import 'package:graetzl/routes/home.dart';
import 'package:graetzl/routes/login_route.dart';
import 'package:graetzl/routes/user_profile_route.dart';
import 'package:graetzl/services/auth.dart';
import 'package:graetzl/widgets/loading.dart';
import 'package:provider/provider.dart';

class TabMenuController extends StatefulWidget {
  _TabMenuControllerState createState() => _TabMenuControllerState();
}

class _TabMenuControllerState extends State<TabMenuController> {
  bool _isLoadingData = true;
  UserData userData;
  int _selectedPageIndex = 0;
  void _selectPage(int index) => setState(() => _selectedPageIndex = index);

  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context);

    if (_user != null) {
      final fetchDAta = DatabaseService(_user.uid).getUserData;
      if (userData == null) {
        fetchDAta.then((r) {
          final u = r.documents.first.data;
          setState(() {
            userData = UserData(
              adress: u['adress'],
              email: u['email'],
              name: u['name'],
              tasks: u['tasks'],
            );
            _isLoadingData = false;
          });
        });
      }
    }

    AppBar appBar(String title) => AppBar(
          title: Text(title),
          actions: <Widget>[
            if (_user != null)
              FlatButton.icon(
                icon: Icon(Icons.power_settings_new),
                label: Text("Sign Out"),
                textColor: Colors.white,
                onPressed: () async => AuthService().signOut(),
              ),
          ],
        );

    final List<Map<String, Object>> _pages = [
      {
        "title": "Kategorien",
        "route": Home(),
      },
      {
        "title": _user == null ? "Einloggen" : "Profil",
        "route": _user == null ? LoginRoute() : UserProfileRoute(),
      }
    ];

    //print("[DEBUG: $_pages]");
    return _isLoadingData
        ? Loading()
        : ChangeNotifierProvider(
            create: (_) => userData,
            child: WillPopScope(
              onWillPop: () => Navigator.of(context).pushNamed("/category"),
              child: Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: appBar(_pages[_selectedPageIndex]["title"]),
                body: _pages[_selectedPageIndex]['route'],
                bottomNavigationBar: BottomNavigationBar(
                  onTap: _selectPage,
                  backgroundColor: Theme.of(context).primaryColor,
                  unselectedItemColor: Colors.white70,
                  selectedItemColor: Colors.white,
                  currentIndex: _selectedPageIndex,
                  showSelectedLabels: true,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.category),
                      title: Text("Kategorien"),
                    ),
                    _user == null
                        ? BottomNavigationBarItem(
                            icon: Icon(Icons.account_circle),
                            title: Text("Einloggen"),
                          )
                        : BottomNavigationBarItem(
                            icon: Icon(Icons.account_circle),
                            title: Text("Profil"),
                          ),
                  ],
                ),
              ),
            ));
  }
}
