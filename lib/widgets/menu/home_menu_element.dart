import 'package:flutter/material.dart';
import 'package:graetzl/database/dbmock.dart';
//import 'package:graetzl/models/task_model.dart';

class HomeMenuElement extends StatelessWidget {
  final String title;
  final String mainImage;
  final String subtitle;
  final int id;

  HomeMenuElement({this.title, this.mainImage, this.subtitle, this.id});

  void _createAndNavigate(BuildContext context) {
    final specificTasks =
        TASKS.where((item) => (item['category'] as List).contains(id)).toList();

    Navigator.of(context).pushNamed("/categories", arguments: {
      "title": title,
      "image": mainImage,
      "subtitle": subtitle,
      "tasks": specificTasks
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _createAndNavigate(context),
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black54,
              fontSize: 14.0,
              fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 1.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
          borderRadius: BorderRadius.circular(5.0),
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.limeAccent,
          ], begin: Alignment.bottomRight, end: Alignment.topCenter),
        ),
      ),
    );
  }
}
