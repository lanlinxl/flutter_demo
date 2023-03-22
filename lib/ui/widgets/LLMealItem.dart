
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/extension/int+.dart';
import 'package:my_flutter_app/core/model/meal_model.dart';
import 'package:my_flutter_app/ui/pages/detail/detail.dart';
import 'package:my_flutter_app/ui/widgets/operation_item.dart';

final cardRadius = 12.px;
class LLMealItem extends StatelessWidget{
    final LLMealModel _mealModel;
    LLMealItem(this._mealModel);

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        child: Card(
            margin: EdgeInsets.all(10.px),
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardRadius)),
            child: Column(
                children: <Widget>[
                  buildBasiInfo(context),
                  buildOperationInfo()
                ],
            ),
        ),
          onTap: (){
              Navigator.of(context)?.pushNamed(LLDetailScreen.routeName, arguments: _mealModel);
          }

      );
    }


    Widget buildBasiInfo(BuildContext context){
        return Stack(
          children: <Widget>[
              ClipRect(
                  child: Image.network(_mealModel.imageUrl, width: double.infinity, height: 250.px, fit: BoxFit.cover,),
              ),

              Positioned(
                  right: 10.px,
                  bottom: 10.px,
                  child: Container(
                    width: 300.px,
                    padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 5.px),
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(6.px)
                    ),
                      child: Text(_mealModel.title,style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),),
                  ),
              ),
          ],
        );
    }

    Widget buildOperationInfo(){
        return Padding(
            padding: EdgeInsets.all(16.px),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  LLOperationItem(Icon(Icons.schedule), "${_mealModel.duration}分钟"),
                  LLOperationItem(Icon(Icons.restaurant), "${_mealModel.complexStr}"),
                  LLOperationItem(Icon(Icons.favorite), "未收藏"),
                ],

            ),


        );
    }


}

