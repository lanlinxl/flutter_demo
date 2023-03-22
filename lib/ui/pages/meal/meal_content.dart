import 'package:flutter/cupertino.dart';
import 'package:my_flutter_app/core/model/category_model.dart';
import 'package:my_flutter_app/core/model/meal_model.dart';
import 'package:my_flutter_app/core/viewmodel/meal_view_model.dart';
import 'package:my_flutter_app/ui/widgets/LLMealItem.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';


class LLMealContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as LLCategoryModel;
    return Selector<LLMealViewModel,List<LLMealModel>>(
      selector: (ctx,mealVM){
        return mealVM.meals.where((meal) {
          return meal.categories.contains(category.id);
        }).toList();
      },
      shouldRebuild: (prev,next) => !const ListEquality().equals(prev, next),
      builder: (ctx , meals ,child){
        return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx,index){
              return LLMealItem(meals[index]);
            },
        );
      },
    );
  }
}
