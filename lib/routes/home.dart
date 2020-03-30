import 'package:flutter/material.dart';
import 'package:graetzl/mixins/device_mixins.dart';
import 'package:graetzl/widgets/menu/home_menu_element.dart';
import '../widgets/menu/menu_elements.dart';

class Home extends StatelessWidget with DeviceSpecificMedia {
  AppBar get appBar => AppBar(
        title: const Text("Grätzl"),
        backgroundColor: Colors.green,
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: deviceHeight(context, appBar) * 0.25,
            child: Stack(
              children: <Widget>[
                Image(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/images/mainPhoto.png"),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    color: Colors.black45,
                    child: Text(
                      'Die Nachbarschafts App',
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
          Container(
            height: deviceHeight(context, appBar) * 0.75,
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                ...MAIN_MENU
                    .map(
                      (item) => HomeMenuElement(
                          id: item['categoryId'],
                          title: item['title'],
                          mainImage: item['image'],
                          subtitle: item['subtitle']),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
