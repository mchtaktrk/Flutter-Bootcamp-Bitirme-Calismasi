import 'dart:convert';

import 'package:bitirme_calismasi/entity/sepet_yemekler.dart';
import 'package:dio/dio.dart';
import 'package:bitirme_calismasi/entity/yemekler.dart';
import 'package:bitirme_calismasi/entity/yemekler_cevap.dart';
import 'package:http/http.dart'as http;

import '../entity/sepet_yemekler_cevap.dart';

class YemeklerDaoRepository{
  List<Yemekler> parseYemeklerCevap(String cevap){
    var jsonVeri = json.decode(cevap);
    var yemeklerCevap = YemeklerCevap.fromJson(jsonVeri).yemekler;
    return yemeklerCevap;
  }
  List<SepetYemekler> parseSepetYemeklerCevap(String cevap){
    var jsonVeri = json.decode(cevap);
    var sepetCevap = SepetYemeklerCevap.fromJson(jsonVeri).sepetYemekler;
    return sepetCevap;
  }


  Future<void> sepeteEkle(String yemek_ad, String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi)async
  {
    kullanici_adi = "mucahitakturk";
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    var veri = {"yemek_adi":yemek_ad,"yemek_resim_adi":yemek_resim_adi,"yemek_fiyat":yemek_fiyat,
      "yemek_siparis_adet":yemek_siparis_adet,"kullanici_adi":"mucahitakturk"};
    var cevap = await Dio().post(url.toString(),data: FormData.fromMap(veri));
    print("Sepete ekle: ${cevap.data.toString()}");
  }
  Future<List<SepetYemekler>> tumSepetiAl() async{
    print("------------------------------");
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    var veri = {"kullanici_adi":"mucahitakturk"};
    var cevap = await http.post(url,body: veri);
    print("\n\nsepet\n${cevap.body}\n");
    return parseSepetYemeklerCevap(cevap.body);
  }

  Future<List<Yemekler>> tumYemekleriAl() async{
    print("------------------------------");
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    var cevap = await Dio().get(url.toString());
    return parseYemeklerCevap(cevap.data);
  }

  Future<void> yemekSil(int sepet_yemek_id,String kullanici_adi) async{
    kullanici_adi = "mucahitakturk";
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    var veri = {"sepet_yemek_id":sepet_yemek_id.toString(),"kullanici_adi":"mucahitakturk"};
    var cevap = await http.post(url,body: veri);
    print("sepetten silindi: ${cevap.body}");
  }
  //future sepetteki yemekleri getir
  //future sepetten yemek sil


}