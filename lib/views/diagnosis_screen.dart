import 'package:flutter/material.dart';
import '../utils/constants.dart';

class DiagnosisScreen extends StatelessWidget {
  const DiagnosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Enter Symptoms for Diagnosis", 
        style: TextStyle(color: TEXT_COLOR, fontSize: 18)
      ),
    );
  }
}