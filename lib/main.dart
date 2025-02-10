import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sanjeevini",
      theme: buildDarkTheme(), // Now correctly defined
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
