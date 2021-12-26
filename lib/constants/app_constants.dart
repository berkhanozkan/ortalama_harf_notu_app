import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const anaRenk = Colors.indigo;
  static const String baslik = 'Ortalama Hesapla';
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w900,
      color: anaRenk,
      fontSize: 25);
  static BorderRadius borderRadius = BorderRadius.circular(20);
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 50,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w900,
      color: anaRenk);
  static final TextStyle ortalamaTextStyle = GoogleFonts.quicksand(
      fontStyle: FontStyle.normal, fontWeight: FontWeight.w500, color: anaRenk);
}
