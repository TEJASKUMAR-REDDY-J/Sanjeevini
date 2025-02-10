import 'package:flutter/material.dart';

class AlertsViewModel extends ChangeNotifier {
  List<String> _alerts = [];

  List<String> get alerts => _alerts;

  void fetchAlerts() {
    _alerts = [
      "New COVID-19 outbreak detected in your area.",
      "Dengue cases rising due to monsoon season.",
      "Flu vaccination available at local clinics."
    ];
    notifyListeners();
  }
}