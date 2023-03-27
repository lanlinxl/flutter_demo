import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/model/meal_model.dart';

// 收藏的菜品
class LLFavorViewModel extends ChangeNotifier{
  final List<LLMealModel> _favorMeals = [];
  List<LLMealModel> get favorMeals {
    return _favorMeals;
  }

  // 添加
  void add(LLMealModel meal){
    _favorMeals.add(meal);
    notifyListeners();
  }

  // 删除
  void remove(LLMealModel meal){
    _favorMeals.remove(meal);
    notifyListeners();
  }

  // 操作
  void handleMeal(LLMealModel meal){
     if (isFavor(meal)){
       remove(meal);
     }else {
       add(meal);
     }
  }

  // 是否已收藏
  bool isFavor(LLMealModel meal){
    return _favorMeals.contains(meal);
  }

}