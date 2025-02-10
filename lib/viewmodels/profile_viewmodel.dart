import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  String _name = "Dr. John Doe";
  String _email = "john.doe@example.com";

  String get name => _name;
  String get email => _email;

  void updateProfile(String newName, String newEmail) {
    _name = newName;
    _email = newEmail;
    notifyListeners();
  }
}