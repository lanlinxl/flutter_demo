import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/model/meal_model.dart';
import 'package:my_flutter_app/core/services/json_parse.dart';
import 'package:my_flutter_app/core/services/meal_request.dart';

// 共享的数据model
class LLMealViewModel extends ChangeNotifier{
  List<LLMealModel> _meals = [];
  List<LLMealModel> get meals {
    return _meals;
  }
  LLMealViewModel() {
    LLJsonParse.getMealData().then((res) {
      _meals = res;
      notifyListeners();
    });
  }
}

