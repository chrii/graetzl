import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graetzl/models/user.dart';
//import 'package:graetzl/routes/home.dart';
//import 'package:graetzl/routes/login_route.dart';
import 'package:graetzl/routes/routes.dart';
import 'package:graetzl/services/auth.dart';
import 'package:graetzl/widgets/menu/tab_menu_controller.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(App());
}

class App extends StatelessWidget {
  build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: "Grätzl",
        theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.greenAccent,
          backgroundColor: Color.fromRGBO(232, 248, 235, 1),
        ),
        home: TabMenuController(),
        routes: routes,
      ),
    );
  }
}
