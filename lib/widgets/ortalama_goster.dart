import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';

class OrtalamaGosterWidget extends StatelessWidget {
  final int dersSayisi;
  final double ortalama;

  const OrtalamaGosterWidget(
      {Key? key, required this.dersSayisi, required this.ortalama})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          dersSayisi > 0 ? '${dersSayisi} ders girildi' : 'Ders Adı Giriniz',
          style: Sabitler.ortalamaTextStyle,
        ),
        Text(
          ortalama > 0 ? '${ortalama.toStringAsFixed(2)}' : '0.0',
          style: Sabitler.ortalamaStyle,
        ),
        Text(
          'Ortalama',
          style: Sabitler.ortalamaTextStyle,
        ),
      ],
    );
  }
}
