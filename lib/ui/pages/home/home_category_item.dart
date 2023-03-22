
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/extension/int+.dart';
import 'package:my_flutter_app/core/model/category_model.dart';
import 'package:my_flutter_app/ui/pages/meal/meal.dart';
class LLHomeCategoryItem extends StatelessWidget {
  final LLCategoryModel _category;
  LLHomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    final bgColor = _category.cColor;

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.px),
          gradient: LinearGradient(
            colors: [
              bgColor.withOpacity(.5),
              bgColor
            ]
          )
        ),
        alignment: Alignment.center,
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold
          ),
        )
      ),

      onTap: (){
        Navigator.of(context).pushNamed(LLMealScreen.routeName,arguments: _category);
      },

    );
  }


}