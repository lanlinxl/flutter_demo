import 'package:flutter/material.dart';

class LLFavorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("我的收藏"),
      ),
      body: const Center(
        child: Text(
          "我的收藏"
        ),
      ),
    );
  }
}
