
import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/extension/int+.dart';
import 'package:my_flutter_app/core/model/meal_model.dart';
import 'package:my_flutter_app/main.dart';
import 'package:my_flutter_app/ui/pages/detail/detail.dart';
import 'package:my_flutter_app/ui/widgets/operation_item.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_app/core/viewmodel/favor_view_model.dart';

final cardRadius = 12.px;

class LLMealItem extends StatelessWidget{
    final LLMealModel _mealModel;
    const LLMealItem(this._mealModel);

    @override
    Widget build(BuildContext context) {
      return Card(
            margin: EdgeInsets.all(10.px),
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardRadius)),
            child: Column(
                children: <Widget>[
                  buildBasiInfo(context),
                  buildOperationInfo()
                ],
            ),
        );
    }

    Widget buildBasiInfo(BuildContext context){
      var string = _mealModel.imageUrl;
      logd("mealModel.imageUrl: $string");
        return Stack(
          children: <Widget>[
              ClipRect(
                  child: GestureDetector(
                      child: Image.network(_mealModel.imageUrl, width: double.infinity, height: 250.px, fit: BoxFit.cover,),
                      onTap: (){
                        Navigator.of(context)?.pushNamed(LLDetailScreen.routeName, arguments: _mealModel);
                      }
                  )
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
                      child: Center(child: Text(_mealModel.title,style: const TextStyle(fontSize: 22,color: Colors.white)) ,),
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
                  GestureDetector(
                    child:  LLOperationItem(const Icon(Icons.schedule), "${_mealModel.duration}分钟") ,
                    onTap: (){
                      logd("LLOperationItem:11111");
                    },
                  ),

                  GestureDetector(
                    child: LLOperationItem(const Icon(Icons.restaurant), _mealModel.complexStr),
                    onTap: (){
                      logd("LLOperationItem:2222");
                    },
                  ),

                  SizedBox(
                    width: 100,
                    child: buildFavorItem(),
                  ),

                ],
            ),
        );
    }


    Widget buildFavorItem() {
      return Consumer<LLFavorViewModel>(
          builder: (ctx , favorVM , child){
            // 1. 判断是否是收藏状态
            final iconData = favorVM.isFavor(_mealModel) ? Icons.favorite: Icons.favorite_border;
            final favorColor = favorVM.isFavor(_mealModel) ? Colors.red : Colors.black;
            final title = favorVM.isFavor(_mealModel) ? "收藏" : "未收藏" ;

            return GestureDetector(
              child: LLOperationItem(
                Icon(iconData,color: favorColor,),
                title,
                textColor: favorColor,
              ),
              onTap: (){
                favorVM.handleMeal(_mealModel);
              },
            );
          },
      );
    }
}



