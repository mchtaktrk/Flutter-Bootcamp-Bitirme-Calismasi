import 'package:bitirme_calismasi/entity/sepet_yemekler.dart';
import 'package:bitirme_calismasi/repo/yemeklerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepeteEkleCubit extends Cubit<List<SepetYemekler>>{
  SepeteEkleCubit():super(<SepetYemekler>[]);

  var krepo = YemeklerDaoRepository();

  Future<void> ekle(
      String yemek_ad,
      String yemek_resim_adi,
      int yemek_fiyat,
      int yemek_siparis_adet,
      String kullanici_adi) async
  {
    await krepo.sepeteEkle(yemek_ad,yemek_resim_adi,yemek_fiyat,yemek_siparis_adet,"mucahitakturk");
  }
  Future<void> sepetiYukle() async{
    print("yemekleri yükle çalıştı");
    var liste = await krepo.tumSepetiAl();
    emit(liste);
  }
  Future<void> sil(int sepet_yemek_id, String kullanici_adi) async {
    await krepo.yemekSil(sepet_yemek_id, "mucahitakturk");

  }
}