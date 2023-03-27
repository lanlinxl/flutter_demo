import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/extension/int+.dart';
import 'package:my_flutter_app/core/model/category_model.dart';
import 'package:my_flutter_app/core/services/json_parse.dart';
import 'package:my_flutter_app/main.dart';
import 'package:my_flutter_app/ui/pages/home/home_category_item.dart';

class LLHomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LLCategoryModel>>(
        future: LLJsonParse.getCategoryData(),
        builder: (ctx , snapshot){
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator(),);
          if (snapshot.error != null) return const Center(child: Text("请求失败"),);

          final categories = snapshot.data as List;
          return GridView.builder(
              padding: EdgeInsets.all(20.px),
              itemCount: categories?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.px,
                mainAxisSpacing: 20.px,
                childAspectRatio: 1.5
              ),
            itemBuilder: (ctx , index){
                return LLHomeCategoryItem(categories[index]);
            },
          );

        }
    );
  }
}