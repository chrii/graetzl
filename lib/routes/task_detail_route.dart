import 'package:flutter/material.dart';
import 'package:graetzl/database/dbmock.dart';
import 'package:graetzl/models/task_model.dart';
import 'package:graetzl/widgets/cards/task_detail_card.dart';

class TaskDetailRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // @TODO:
    // Userdata should come from auth
    final _user = USERS.firstWhere((item) => item['id'] == 1);

    final Task _task = ModalRoute.of(context).settings.arguments;

    final appBar = AppBar(
      title: Text("Detail Page"),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar,
      body: TaskDetailCard(user: _user['user'], task: _task),
    );
  }
}
