import 'package:bitirme_calismasi/cubit/anasayfa_cubit.dart';
import 'package:bitirme_calismasi/cubit/sepete_ekle_cubit.dart';
import 'package:bitirme_calismasi/cubit/yemek_detay_cubit.dart';
import 'package:bitirme_calismasi/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => YemekDetayCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
        BlocProvider(create: (context)=> SepeteEkleCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}
