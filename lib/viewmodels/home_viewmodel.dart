import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<Map<String, String>> _diseaseInfo = [];

  List<Map<String, String>> get diseaseInfo => _diseaseInfo;

  void fetchDiseaseData() {
    _diseaseInfo = [
      {"title": "COVID-19", "description": "Recent outbreaks detected."},
      {"title": "Dengue", "description": "Cases rising due to seasonal changes."}
    ];
    notifyListeners();
  }
}