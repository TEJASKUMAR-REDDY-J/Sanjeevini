import 'package:flutter/material.dart';

class DiagnosisViewModel extends ChangeNotifier {
  String _diagnosisResult = "";

  String get diagnosisResult => _diagnosisResult;

  void analyzeSymptoms(List<String> symptoms) {
    if (symptoms.contains("fever") && symptoms.contains("cough")) {
      _diagnosisResult = "Possible Flu or COVID-19. Please consult a doctor.";
    } else {
      _diagnosisResult = "No serious symptoms detected.";
    }
    notifyListeners();
  }
}