import 'package:bitirme_calismasi/entity/sepet_yemekler.dart';

class SepetYemeklerCevap{
  final sepetYemekler;
 // int success;

  SepetYemeklerCevap({required this.sepetYemekler});

  factory SepetYemeklerCevap.fromJson(Map<String,dynamic> json){
    var jsonArray = json["sepet_yemekler"] as List;
    //var success = json["success"] as int;
    print("\n******************************\njson array = $jsonArray");
    List<SepetYemekler> sepetYemekler = jsonArray.map((e) => SepetYemekler.fromJson(e)).toList();
    return SepetYemeklerCevap(sepetYemekler: sepetYemekler);
  }
}