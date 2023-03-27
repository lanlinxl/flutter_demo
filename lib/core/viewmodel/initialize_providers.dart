import 'favor_view_model.dart';
import 'meal_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;

List<SingleChildWidget> customProviders = [
  ChangeNotifierProvider(create: (ctx) => LLFavorViewModel()),
  ChangeNotifierProvider(create: (ctx) => LLMealViewModel()),
];