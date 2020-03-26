import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OAuthButton extends StatelessWidget {
  final FaIcon icon;
  final String label;
  final Color color;

  OAuthButton({this.icon, this.label, this.color});

  build(BuildContext context) {
    return RaisedButton.icon(
      elevation: 0,
      color: color,
      onPressed: () {},
      icon: icon,
      label: Text(label),
    );
  }
}
