import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/model/meal_model.dart';
import 'package:my_flutter_app/core/services/meal_request.dart';

class LLMealViewModel extends ChangeNotifier{
  List<LLMealModel> _meals = [];
  List<LLMealModel> get meals {
    return _meals;
  }
  LLMealViewModel() {

    LLMealRequest.getMealData().then((res) {
      _meals = res;
      notifyListeners();
    });
  }

}

