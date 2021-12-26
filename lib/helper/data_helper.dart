import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/model/ders.dart';

class DropdownHelper {
  static List<String> _notHarfleriniGoster() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static List<Ders> tumEklenenDersler = [];

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static double OrtalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    tumEklenenDersler.forEach((element) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi += element.krediDegeri;
    });

    return (toplamNot / toplamKredi);
  }

  static double _notHarfleriniCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1.0;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0;
      default:
        return 0.1;
    }
  }

  static List<DropdownMenuItem<double>> buildDropdownNot() {
    return _notHarfleriniGoster()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _notHarfleriniCevir(e),
            ))
        .toList();
  }

  //
  static List<int> _notKredileriniOlustur() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<double>> buildDropdownKredi() {
    return _notKredileriniOlustur()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }
}
