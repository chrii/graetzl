import 'package:flutter/material.dart';
import 'package:graetzl/models/task_model.dart';

class TaskDetailCard extends StatelessWidget {
  final Task task;

  // @TODO
  // Userdata should come as an object
  // Avatar is implemented so that the fallback can fall back
  final String user;
  final String avatar;

  TaskDetailCard({this.task, this.user, this.avatar});

  String get _assetImage =>
      task.image == null ? "assets/images/gulasch2.jpg" : task.image;

  String get _description =>
      task.taskDescription == null ? "" : task.taskDescription;

  Widget _assetAvatar(BuildContext ctx) => avatar == null
      ? CircleAvatar(
          backgroundColor: Theme.of(ctx).accentColor,
          child: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
        )
      : CircleAvatar(
          backgroundImage: AssetImage(avatar),
        );

  Widget _headerTile(BuildContext ctx) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(ctx).accentColor,
          child: _assetAvatar(ctx),
        ),
        title: Text(
          user,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(task.taskType),
      );

  Widget _pictureContainer(BuildContext ctx) => Container(
        height: 200,
        width: MediaQuery.of(ctx).size.width,
        child: Image(
          image: AssetImage(_assetImage),
          fit: BoxFit.fitWidth,
        ),
      );

  Widget get _textContainer => Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text(
                task.taskName,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(_description),
          ],
        ),
      );

  Widget _buttonBar(BuildContext ctx) => ButtonBar(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text("Anschreiben"),
            textColor: Theme.of(ctx).accentColor,
          ),
        ],
      );

  Widget build(BuildContext ctx) {
    return SingleChildScrollView(
      child: Card(
        elevation: 4.0,
        child: Column(
          children: <Widget>[
            _headerTile(ctx),
            _pictureContainer(ctx),
            _textContainer,
            _buttonBar(ctx),
          ],
        ),
      ),
    );
  }
}
