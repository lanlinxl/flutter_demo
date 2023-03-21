import 'package:flutter/cupertino.dart';

class LLCategoryModel {
  String id;
  String title;
  String color;
  Color cColor;

  LLCategoryModel({
    required this.id,
    required this.title,
    required this.color,
    required this.cColor
  });

  factory LLCategoryModel.fromJson(Map<String, dynamic> json) => LLCategoryModel(
    id : json['id'],
    title : json['title'],
    color : json['color'],
    cColor : Color(int.parse(json['color'], radix: 16) | 0xFF000000),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['color'] = color;
    return data;
  }

}