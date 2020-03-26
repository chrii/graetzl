import 'package:flutter/material.dart';
import 'package:graetzl/routes/home.dart';
import 'package:graetzl/routes/login_route.dart';
import 'package:graetzl/routes/routes.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  build(BuildContext ctx) {
    return MaterialApp(
      title: "Grätzl",
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent,
        backgroundColor: Color.fromRGBO(232, 248, 235, 1),
      ),
      home: LoginRoute(),
      routes: routes,
    );
  }
}
