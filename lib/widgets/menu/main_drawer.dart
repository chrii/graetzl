import 'package:flutter/material.dart';
import './menu_elements.dart';

class MainDrawer extends StatelessWidget {
  final List categoryItems;

  MainDrawer(this.categoryItems);

  build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Text("USER"),
          ),
          Container(
            child: ListView.builder(
              itemCount: MAIN_MENU.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  MAIN_MENU[index]['title'],
                ),
              ),
            ),
            height: 200.0,
          ),
        ],
      ),
    );
  }
}
