
import 'package:flutter/cupertino.dart';
import 'package:my_flutter_app/core/viewmodel/favor_view_model.dart';
import 'package:my_flutter_app/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class LLFavorContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<LLFavorViewModel>(
        builder: (ctx , favorVM , child){
          if (favorVM.favorMeals.isEmpty){
            return const Center(
              child: Text("未收藏美食"),
            );
          }

          return ListView.builder(
            itemCount: favorVM.favorMeals.length,
              itemBuilder: (itemCtx , index){
                 return LLMealItem(favorVM.favorMeals[index]);
              }
          );
        }
    );


  }

}