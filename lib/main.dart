import 'package:flutter/material.dart';
import 'package:graetzl/routes/home.dart';
import 'package:graetzl/routes/routes.dart';
import 'package:location/location.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  build(BuildContext ctx) {
    print(Location());
    return MaterialApp(
      title: "Grätzl",
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent,
      ),
      home: Home(),
      routes: routes,
    );
  }
}
