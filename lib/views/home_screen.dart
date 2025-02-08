import 'package:flutter/material.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Welcome to Sanjeevini", 
        style: TextStyle(color: TEXT_COLOR, fontSize: 24, fontWeight: FontWeight.bold)
      ),
    );
  }
}