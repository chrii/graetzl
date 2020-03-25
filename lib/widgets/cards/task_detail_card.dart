import 'package:flutter/material.dart';

class TaskDetailCard extends StatelessWidget {
  final String user;
  final String type;
  final String title;
  final String description;
  final String avatar;
  final String image;

  TaskDetailCard(
      {@required this.user,
      @required this.type,
      @required this.title,
      this.description,
      this.avatar,
      this.image});

  String get _assetImage =>
      image == null ? "assets/images/gulasch2.jpg" : image;

  String get _description => description == null ? "" : description;

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
        subtitle: Text(type),
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
                title,
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
