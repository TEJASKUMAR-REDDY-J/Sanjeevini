import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ChatAssistantScreen extends StatelessWidget {
  const ChatAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Chat with Sanjeevini AI Assistant", 
        style: TextStyle(color: TEXT_COLOR, fontSize: 18)
      ),
    );
  }
}