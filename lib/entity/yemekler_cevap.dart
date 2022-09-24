import 'package:bitirme_calismasi/entity/yemekler.dart';

class YemeklerCevap{
  final yemekler;
  //List<Yemekler> yemekler;
 // String success;

  YemeklerCevap({required this.yemekler});

  factory YemeklerCevap.fromJson(Map<String,dynamic> json){
    var jsonArray = json["yemekler"] as List;
    //var success = json["success"] as String;
    List<Yemekler> yemeklerCevap = jsonArray.map((e) => Yemekler.fromJson(e)).toList();

    return YemeklerCevap(yemekler: yemeklerCevap);
  }
}