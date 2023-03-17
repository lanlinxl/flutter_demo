import 'package:flutter/material.dart';
import '../main/initialize_items.dart';
class LLMainScreen extends StatefulWidget{
  static const String routeName = "/";

  @override
  State<LLMainScreen> createState() => _LLMainScreenState();
}

class _LLMainScreenState extends State<LLMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages ,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: items,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}