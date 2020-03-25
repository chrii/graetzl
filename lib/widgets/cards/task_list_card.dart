import 'package:flutter/material.dart';

class TaskListCard extends StatelessWidget {
  final String title;
  final String type;
  final String description;
  final String imagePath;

  TaskListCard({this.title, this.description, this.type, this.imagePath});

  Widget build(BuildContext ctx) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            title: Text(title),
            subtitle: Text(type),
            leading: CircleAvatar(
              backgroundImage: imagePath == null
                  ? AssetImage("assets/images/gulasch2.jpg")
                  : AssetImage(imagePath),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              description,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                textColor: Theme.of(ctx).accentColor,
                onPressed: () {},
                child: Text("More Info"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
