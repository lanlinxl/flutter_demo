import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_flutter_app/core/model/category_model.dart';
import 'package:my_flutter_app/main.dart';

class LLJsonParse {
  static Future<List<LLCategoryModel>> getCategoryData() async {
    logd("getCategoryDatagetCategoryDatagetCategoryData");
    // 1. 加载json文件
    final jsonString = await rootBundle.loadString("assets/json/category.json");
    logd("jsonString： $jsonString");
    // 2.将jsonString转成Map/List
    final result = json.decode(jsonString);

    // 3.将Map中的内容转成一个个对象
    final reslutList = result["category"];
    List<LLCategoryModel> categorries = [];

    for (var json in reslutList){
      categorries.add(LLCategoryModel.fromJson(json));
    }
    return categorries;
  }

}