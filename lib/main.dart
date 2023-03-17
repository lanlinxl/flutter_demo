import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:my_flutter_app/core/router/routers.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_app/core/viewmodel/meal_view_model.dart';
import 'package:my_flutter_app/common/size_fit.dart';

/// 日志打印相关
final Logger _logger = Logger(
  // 过滤掉方法实现的栈打印
  printer: PrefixPrinter(PrettyPrinter(
    stackTraceBeginIndex: 1,
    methodCount: 2,
  )),
);

void logd(dynamic message) =>  _logger.d(message); 
void logv(dynamic message) =>  _logger.v(message); 
void logi(dynamic message) =>  _logger.i(message); 
void logw(dynamic message) =>  _logger.w(message); 
void loge(dynamic message) =>  _logger.e(message); 
void logwtf(dynamic message) => _logger.wtf(message);



void main() {
  logd("ssss11111");
  runApp(
    ChangeNotifierProvider(
        create: (ctx) => LLMealViewModel(),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LLSizeFit.initialize();

    return MaterialApp(
      title: "美食广场",
      initialRoute: LLRouter.initialRoute,
      routes: LLRouter.routers,
      onGenerateRoute: LLRouter.generateRoute,
      onUnknownRoute: LLRouter.unknownRoute,
    );
  }
}
