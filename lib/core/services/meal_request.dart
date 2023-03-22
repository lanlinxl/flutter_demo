import 'package:my_flutter_app/core/model/meal_model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class LLMealRequest {

  static Future<List<LLMealModel>> getMealData() async {
    // 1.发送网络请求
    final url = "/meal";
    final dio = Dio();
    final response = await dio.get('url');

    // 2. 将data数据转化为json
    var jsonList = jsonDecode(response.data);
    List<LLMealModel> mealList = [];
    for (var json in jsonList){
      mealList.add(LLMealModel.fromJson(json));
    }
    return mealList;
  }
}