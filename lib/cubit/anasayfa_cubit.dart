import 'package:bitirme_calismasi/entity/yemekler.dart';
import 'package:bitirme_calismasi/repo/yemeklerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>>{
  AnasayfaCubit():super(<Yemekler>[]);

  var krepo = YemeklerDaoRepository();

  Future<void> yemekleriYukle() async{
    print("yemekleri yükle çalıştı");
    var liste = await krepo.tumYemekleriAl();
    emit(liste);
  }

  Future<void> sil(int yemek_id) async{
   print("sil çalıştı");
   //await krepo.yemekSil(yemek_id);
  }
}
