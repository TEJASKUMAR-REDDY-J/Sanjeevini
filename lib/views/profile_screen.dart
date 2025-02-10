import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("User Profile", 
        style: TextStyle(color: TEXT_COLOR, fontSize: 18)
      ),
    );
  }
}