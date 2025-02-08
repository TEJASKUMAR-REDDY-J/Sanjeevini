import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("No new alerts at the moment", 
        style: TextStyle(color: TEXT_COLOR, fontSize: 18)
      ),
    );
  }
}