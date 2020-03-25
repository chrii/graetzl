import 'package:flutter/material.dart';

mixin DeviceSpecificMedia {
  double deviceHeight(BuildContext context, AppBar appBar) {
    return MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
  }
}
