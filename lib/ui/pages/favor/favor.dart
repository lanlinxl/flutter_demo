import 'package:flutter/material.dart';
import 'package:my_flutter_app/ui/pages/favor/favor_content.dart';

class LLFavorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("我的收藏"),
      ),
      body: LLFavorContent(),
    );
  }
}
