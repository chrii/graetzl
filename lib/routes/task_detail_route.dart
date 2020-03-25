import 'package:flutter/material.dart';
import 'package:graetzl/database/dbmock.dart';
import 'package:graetzl/models/task_model.dart';
import 'package:graetzl/widgets/cards/task_detail_card.dart';

class TaskDetailRoute extends StatelessWidget {
  final _user = USERS.firstWhere((item) => item['id'] == 1);

  Widget build(BuildContext context) {
    final Task _task = (ModalRoute.of(context).settings.arguments
        as Map<String, Object>)['payload'];

    final appBar = AppBar(
      title: Text("Detail Page"),
    );

    return Scaffold(
      appBar: appBar,
      body: TaskDetailCard(
          user: _user['user'], type: _task.taskType, title: _task.taskName),
    );
  }
}
