import 'package:flutter/material.dart';

class UserData with ChangeNotifier {
  final String name;
  final String adress;
  final String email;
  final List tasks;

  UserData({this.adress, this.email, this.name, this.tasks});
}
