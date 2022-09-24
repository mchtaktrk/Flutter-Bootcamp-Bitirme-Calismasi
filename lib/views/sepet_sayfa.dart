import 'package:bitirme_calismasi/cubit/sepete_ekle_cubit.dart';
import 'package:bitirme_calismasi/entity/sepet_yemekler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetSayfa extends StatefulWidget {

  @override
  State<SepetSayfa> createState() => _SepetSayfaState();
}

class _SepetSayfaState extends State<SepetSayfa> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SepeteEkleCubit>().sepetiYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sepet"),backgroundColor: Colors.purple,),
      body: BlocBuilder<SepeteEkleCubit,List<SepetYemekler>>(
        builder: (context,yemeklerListesi){
          if(yemeklerListesi.isNotEmpty){
            return ListView.builder(
              itemCount: yemeklerListesi.length,
              itemBuilder: (context,indeks){
                var yemek = yemeklerListesi[indeks];
                return GestureDetector(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 30),
                            child: SizedBox(
                                width: 100,
                                height: 100,
                                child:
                                Image.network('http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}')
                            ),
                          ),
                          Text("${yemek.yemek_adi}"),
                          Spacer(),
                          Text("${yemek.yemek_fiyat}₺ X",style: TextStyle(fontSize: 20,color: Colors.black54),),
                          Text("${yemek.yemek_siparis_adet} = ",style: TextStyle(fontSize: 20,color: Colors.black54),),
                          Text("${(int.parse(yemek.yemek_fiyat) * int.parse( yemek.yemek_siparis_adet))}₺",style: TextStyle(fontSize: 20,color: Colors.black54),),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${yemek.yemek_resim_adi} silinsin mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: (){
                                      context.read<SepeteEkleCubit>().sil(int.parse(yemek.sepet_yemek_id), "mucahitakturk");
                                      context.read<SepeteEkleCubit>().sepetiYukle();
                                      },
                                  ),
                                ));
                          }, icon: const Icon(Icons.delete_outline,color: Colors.black45,))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
    );
  }
}
