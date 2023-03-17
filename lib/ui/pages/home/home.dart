import 'package:flutter/material.dart';
import '../home/home_content.dart';

class LLHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("美食广场"),
      ),
      body: LLHomeContent(),
    );
  }

}