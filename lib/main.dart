import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/dinamik_ortalama_hesapla_page.dart';

import 'constants/app_constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinamik Not Ortalaması Hesapla',
      home: DinamikOrtalamaHesaplaPage(),
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
      ),
    );
  }
}
