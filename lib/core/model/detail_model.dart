import 'dart:convert';

class LLDetailModel {

}


class Status {
  int code;
  String msg;

  Status({required this.code ,required this.msg});

   factory Status.fromJson(Map<String , dynamic> json) => Status(
       code: json["code"],
       msg: json["msg"]
   );

  Map<String, dynamic> toJson() => {
    "code": code,
    "msg": msg,
  };
}





// 反转map的键与值
class EnumValues<T>{
  Map<String,T> map;
  Map<T,String>reverseMap = {};// 默认为空

  EnumValues(this.map);

  Map<T , String> get reverse{
    if (reverseMap.isEmpty) {
      reverseMap = map.map((key, value) => MapEntry(key as T, value as String));
    }
    return reverseMap;
  }

}