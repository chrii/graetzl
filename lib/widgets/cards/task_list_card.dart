import 'package:flutter/material.dart';
import 'package:graetzl/models/task_model.dart';

class TaskListCard extends StatelessWidget {
  final Task task;

  TaskListCard(this.task);

  void _navigate(BuildContext context) =>
      Navigator.of(context).pushNamed("/detail", arguments: task);

  Widget build(BuildContext ctx) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            title: Text(task.taskName),
            subtitle: Text(task.taskType),
            leading: CircleAvatar(
              backgroundImage: task.image == null
                  ? AssetImage("assets/images/gulasch2.jpg")
                  : AssetImage(task.image),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              task.taskDescription,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                textColor: Theme.of(ctx).accentColor,
                onPressed: () => _navigate(ctx),
                child: Text("More Info"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
