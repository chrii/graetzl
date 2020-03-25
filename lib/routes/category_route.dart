import 'package:flutter/material.dart';
import '../mixins/device_mixins.dart';
import '../widgets/lists/category_list.dart';

class CategoryRoute extends StatelessWidget with DeviceSpecificMedia {
/*   final String title;

  CategoryRoute({this.title}); */

  final List tasks = [
    {
      "taskId": 1,
      "photo": "placeholder",
      "taskName": "Kartoffelgulasch",
      "taskType": "foodsharing",
      "taskDescription":
          "Ich habe ein Kartoffel Gulasch gemacht und es blieb etwas übrig. Bitte melden wenn Interesse."
    },
    {
      "taskId": 2,
      "photo": "placeholder",
      "taskName": "Einkauf",
      "taskType": "helpingHand",
      "taskDescription":
          "Ich sitze derzeit mit einem gebrochenen Bei zuhause und kann nich einkaufen gehen."
    }
  ];

  @override
  Widget build(BuildContext context) {
    final _routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final appBar = AppBar(
      title: Text(
        _routeArguments['title'],
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: deviceHeight(context, appBar) * 0.25,
              child: Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  Image(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(_routeArguments['image']),
                  ),
                  Positioned(
                    bottom: 10.0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      color: Colors.black45,
                      child: Text(
                        _routeArguments['subtitle'],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: deviceHeight(context, appBar),
              child: CategoryList(_routeArguments['tasks']),
            ),
          ],
        ),
      ),
    );
  }
}
