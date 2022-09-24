import 'package:bitirme_calismasi/entity/yemekler.dart';
import 'package:bitirme_calismasi/views/sepet_sayfa.dart';
import 'package:bitirme_calismasi/views/yemek_detay_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/anasayfa_cubit.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().yemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Yemek Sipariş",style: TextStyle(color: Colors.white),),
            Spacer(),
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
              onPressed: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SepetSayfa()));

                });
              },
            ),
          ],
        ),
        backgroundColor: Colors.purple,),
      body:BlocBuilder<AnasayfaCubit,List<Yemekler>>(
        builder: (context,yemeklerListesi){
          if(yemeklerListesi.isNotEmpty){
            return ListView.builder(
              itemCount: yemeklerListesi.length,
              itemBuilder: (context,indeks){
                var yemek = yemeklerListesi[indeks];
                return GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => YemekDetaySayfa(yemek: yemek,)));},
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
                          Text("${yemek.yemek_fiyat}₺",style: TextStyle(fontSize: 25,color: Colors.black54),),
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
