import 'package:flutter/material.dart';

class ChatViewModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _messages = [];

  List<Map<String, dynamic>> get messages => _messages;

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      _messages.add({"text": message, "isUser": true});
      _messages.add({"text": "This is an AI-generated response.", "isUser": false});
      notifyListeners();
    }
  }
}