
import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/extension/int+.dart';
import 'package:my_flutter_app/core/model/meal_model.dart';

class LLDetailContent extends StatelessWidget {
  final LLMealModel _meal;
  LLDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildBannerImage(),
          buildMakeTitle(context:context,title: "制作材料"),
          buildMakeMaterial(context),
          buildMakeTitle(context:context,title:  "制作步骤"),
          buildMakeSteps(context)
        ],
      ),
    );
  }


  // 1.横幅图片
   Widget buildBannerImage() {
     return SizedBox(
       width: double.infinity,
       child: Image.network(_meal.imageUrl),
     );
   }

  // 2.制作材料
  Widget buildMakeMaterial(BuildContext context){
     return buildMakeContent(
       context: context,
       child: ListView.builder(
         padding: EdgeInsets.zero,
         shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
         itemCount: _meal.ingredients.length,
         itemBuilder: (BuildContext context, int index) {
             return Card(
               color: Theme.of(context).colorScheme.secondary,
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                 child: Text(_meal.ingredients[index]),
               ),
             );
         },
       ),
     );
  }

  Widget buildMakeContent({required BuildContext context ,required Widget child }){
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.px)
      ),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child,
    );
  }


   Widget buildMakeTitle({required BuildContext context ,required String title }){
     return Container(
       padding: EdgeInsets.symmetric(vertical: 12.px),
       child: Text(title, style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),),
     );
   }


   // 3.制作步骤
  Widget buildMakeSteps(BuildContext context) {
    return buildMakeContent(
        context: context,
        child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: _meal.steps.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text("#${index+1}"),
                ),
                title: Text(_meal.steps[index]),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            }
        )
    );
  }
}