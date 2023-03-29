
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/model/meal_model.dart';
import 'package:my_flutter_app/core/router/unknown.dart';
import 'package:my_flutter_app/main.dart';
import 'package:my_flutter_app/ui/pages/detail/detail.dart';
import 'package:my_flutter_app/ui/pages/main/main.dart';
import 'package:my_flutter_app/ui/pages/meal/meal.dart';

class LLRouter {
  static const String initialRoute = LLMainScreen.routeName;

  static final Map<String,WidgetBuilder> routers = {
     LLMainScreen.routeName: (ctx) => LLMainScreen(),
     LLMealScreen.routeName: (ctx) => LLMealScreen(),
     // LLDetailScreen.routeName: (ctx) => LLDetailScreen(),
  };

  // 当routers没有注册相关路由widget 则会执行下面的方法
  static RouteFactory get generateRoute => (settings) {
    logd("settings.name: $settings.name");
    if (settings.name == LLDetailScreen.routeName){
      return  MaterialPageRoute(
          builder: (ctx) {
            return LLDetailScreen(settings.arguments as LLMealModel);
          }
      );
    }
    return null;
  };

  // 当routers没有注册相关路由widget 而且generateRoute方法返回null 则会执行此方法返回异常页面
  static RouteFactory get unknownRoute => (settings) {
    return MaterialPageRoute(
        builder: (ctx) {
          return LLUnknownPage();
        }
    );
  };

}