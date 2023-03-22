

import 'package:flutter/cupertino.dart';
import 'package:my_flutter_app/core/extension/int+.dart';

class LLOperationItem extends StatelessWidget{
  final Widget _icon;
  final String _title;

  LLOperationItem(this._icon,this._title);

  @override
  Widget build(BuildContext context) {
     return Row(
       children: <Widget>[
         _icon,
         SizedBox(width: 3.px,),
         Text(_title)
       ],
     );
  }

}