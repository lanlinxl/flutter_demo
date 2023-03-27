
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/router/unknown.dart';
import 'package:my_flutter_app/main.dart';
import 'package:my_flutter_app/ui/pages/main/main.dart';
import 'package:my_flutter_app/ui/pages/meal/meal.dart';

class LLRouter {
  static const String initialRoute = LLMainScreen.routeName;

  static final Map<String,WidgetBuilder> routers = {
     LLMainScreen.routeName: (ctx) => LLMainScreen(),
     LLMealScreen.routeName: (ctx) => LLMealScreen(),
  };

  static final RouteFactory generateRoute = (settings) {
    logd("settings.name: $settings.name");
    if (settings.name == LLMainScreen.routeName){
      return  MaterialPageRoute(
          builder: (ctx) {
            return LLMainScreen();
          }
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(
        builder: (ctx) {
          return LLUnknownPage();
        }
    );
  };

}