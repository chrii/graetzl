import 'package:flutter/material.dart';
import 'package:graetzl/database/dbmock.dart';
import 'package:graetzl/models/task_model.dart';
import 'package:graetzl/widgets/menu/main_drawer.dart';
import '../mixins/device_mixins.dart';
import '../widgets/lists/category_list.dart';
import '../widgets/menu/main_drawer.dart';

class CategoryRoute extends StatelessWidget with DeviceSpecificMedia {
  List<Task> mockFunctionTasks(int id) {
    return TASKSMOCK.where((item) => item.category.contains(id)).toList();
  }

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
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar,
      drawer: MainDrawer(),
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
            SizedBox(height: 5.0),
            Container(
              height: deviceHeight(context, appBar),
              child: CategoryList(
                mockFunctionTasks(_routeArguments['id']),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
