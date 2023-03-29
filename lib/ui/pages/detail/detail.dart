
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/model/meal_model.dart';


class LLDetailScreen extends StatelessWidget {
  static const String routeName = "/detail";
  final LLMealModel mealModel;

  LLDetailScreen(this.mealModel);

  @override
  Widget build(BuildContext context) {
    // final model = ModalRoute.of(context)?.settings.arguments as LLMealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealModel.title),
      ),
      body: Center(
        child: Text(mealModel.title),
      ),
    );
  }


}