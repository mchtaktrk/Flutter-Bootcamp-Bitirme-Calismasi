import 'package:bitirme_calismasi/cubit/sepete_ekle_cubit.dart';
import 'package:bitirme_calismasi/entity/yemekler.dart';
import 'package:bitirme_calismasi/views/sepet_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekDetaySayfa extends StatefulWidget {
  Yemekler yemek;
  YemekDetaySayfa({required this.yemek});

  @override
  State<YemekDetaySayfa> createState() => _YemekDetaySayfaState();
}

class _YemekDetaySayfaState extends State<YemekDetaySayfa> {
  var gelenYemek;
  var adet=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gelenYemek = widget.yemek;
  }
  /*
  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfKisiAdi.text = kisi.kisi_ad;
    tfKisiTel.text = kisi.kisi_tel;
  }
  * */
  @override
  Widget build(BuildContext context) {
    var tfAdet = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Yemek Sipariş",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.purple,),
        body:Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child:
                Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network('http://kasimadalan.pe.hu/yemekler/resimler/${gelenYemek.yemek_resim_adi}'),
                    Text("${gelenYemek.yemek_adi}",style: TextStyle(fontSize: 50),),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Adet",style: TextStyle(fontSize: 25,color: Colors.purple),),
                          Card(
                            color: Colors.purple,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove,color: Colors.white,),
                                  onPressed: () {
                                    setState(() {
                                      //---------------- azalt
                                      if(adet>0){
                                        adet--;
                                      }

                                    });
                                  },
                                ),

                                Text("$adet",style: TextStyle(color: Colors.white,fontSize: 25),),
                                IconButton(
                                  icon: const Icon(Icons.add,color: Colors.white,),
                                  onPressed: () {
                                    setState(() {
                                      //-------------arttır
                                      adet++;
                                    });
                                  },
                                ),
                              ],),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding:const EdgeInsets.symmetric(horizontal: 50, vertical: 20), ),
                  onPressed: () {
                    print("${gelenYemek.yemek_adi} - ${gelenYemek.yemek_resim_adi} - ${gelenYemek.yemek_fiyat} - ${adet}");
                    context.read<SepeteEkleCubit>().ekle(gelenYemek.yemek_adi, gelenYemek.yemek_resim_adi, int.parse(gelenYemek.yemek_fiyat), adet, "mucahitakturk");
                    },
                  label: Text("SEPETE EKLE"),
                  icon: Icon(Icons.shopping_cart_outlined, size: 18),

                )
              ],
            ),
          ],
        )
    );
  }
}
