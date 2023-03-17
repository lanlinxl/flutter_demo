

// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/router/unknown.dart';
import 'package:my_flutter_app/ui/pages/main/main.dart';

class LLRouter {
  static const String initialRoute = LLMainScreen.routeName;

  static final Map<String,WidgetBuilder> routers = {
     LLMainScreen.routeName: (ctx) => LLMainScreen(),
  };

  static final RouteFactory generateRoute = (settings) {
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