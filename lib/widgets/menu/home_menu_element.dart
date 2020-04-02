import 'package:flutter/material.dart';

class HomeMenuElement extends StatelessWidget {
  final String title;
  final String mainImage;
  final String subtitle;
  final int id;

  HomeMenuElement({this.title, this.mainImage, this.subtitle, this.id});

  void _createAndNavigate(BuildContext context) {
    // @TODO: Find a better solution to instantiate the tasks
    // Maybe there is a better solution when firebase is hooked up
    // The tasks shouldnt be instantiated AFTER they got filtered
    // Wheter or not it makes in this case no difference because ALL tasks should
    // be instantiated BEFORE the button is clicked
    // Inhere it should just filter the necessary tasks

    Navigator.of(context).pushNamed("/categories", arguments: {
      "title": title,
      "image": mainImage,
      "subtitle": subtitle,
      "id": id
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
              color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 8.0,
                offset: Offset(2.5, 2.5),
              ),
            ],
            borderRadius: BorderRadius.circular(5.0),
            color: Theme.of(context).primaryColor),
      ),
    );
  }
}
