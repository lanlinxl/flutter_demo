
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/model/category_model.dart';
import 'package:my_flutter_app/ui/pages/meal/meal_content.dart';

class LLMealScreen extends StatelessWidget {
  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as LLCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: LLMealContent(),
    );

  }
}