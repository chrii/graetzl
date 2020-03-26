import 'package:flutter/material.dart';
import 'package:graetzl/routes/home.dart';
import 'package:graetzl/routes/login_route.dart';
import 'package:graetzl/routes/routes.dart';

void main() => runApp(App());

final bool _isLoggedIn = false;

class App extends StatelessWidget {
  build(BuildContext context) {
    return MaterialApp(
      title: "Grätzl",
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent,
        backgroundColor: Color.fromRGBO(232, 248, 235, 1),
      ),
      home: _isLoggedIn ? Home() : LoginRoute(),
      routes: routes,
    );
  }
}
