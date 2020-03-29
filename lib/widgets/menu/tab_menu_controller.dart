import 'package:flutter/material.dart';
import 'package:graetzl/routes/home.dart';
import 'package:graetzl/routes/login_route.dart';
//import 'package:graetzl/services/auth.dart';

class TabMenuController extends StatefulWidget {
  _TabMenuControllerState createState() => _TabMenuControllerState();
}

class _TabMenuControllerState extends State<TabMenuController> {
  final List<Map<String, Object>> _pages = [
    {
      "title": "Kategorien",
      "route": Home(),
      "needsLoginstatus": false,
      "navigationAtributes": BottomNavigationBarItem(
        icon: Icon(Icons.category),
        title: Text("Categories"),
      ),
    },
    {
      "title": "Einloggen",
      "route": LoginRoute(),
      "needsLoginstatus": false,
      "navigationAtributes": BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        title: Text("Login"),
      ),
    },
    {
      "title": "Profil",
      "route": LoginRoute(),
      "needsLoginstatus": false,
      "navigationAtributes": BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        title: Text("Profil"),
      ),
    }
  ];

  int _selectedPageIndex = 0;
  void _selectPage(int index) => setState(() => _selectedPageIndex = index);

  build(BuildContext context) {
    AppBar appBar(String title) => AppBar(
          title: Text(title),
        );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar(_pages[_selectedPageIndex]["title"]),
      body: _pages[_selectedPageIndex]["route"],
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
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Login"),
          )
        ],
      ),
    );
  }
}
