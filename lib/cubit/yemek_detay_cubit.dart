import 'package:bitirme_calismasi/repo/yemeklerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekDetayCubit extends Cubit<void>{
  YemekDetayCubit():super(0);

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
}
