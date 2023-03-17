import 'package:flutter/material.dart';
import '../home/home.dart';
import '../favor/favor.dart';

final List<Widget> pages = [
  LLHomeScreen(),
  LLFavorScreen()
];

// 底部tabbar
final List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(
      label: "首页",
      icon: Icon(Icons.home)
  ),

  const BottomNavigationBarItem(
      label: "收藏",
      icon: Icon(Icons.star)
  ),

];