import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget {
  const HarfDropdownWidget({Key? key, required this.onHarfSecildi})
      : super(key: key);
  final Function onHarfSecildi;

  @override
  _HarfDropdownWidgetState createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfNotDeger = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        //  margin: EdgeInsets.all(10),
        // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: Sabitler.anaRenk.shade100,
            borderRadius: Sabitler.borderRadius),
        child: DropdownButton<double>(
          items: DropdownHelper.buildDropdownNot(),
          value: secilenHarfNotDeger,
          onChanged: (deger) {
            setState(() {
              secilenHarfNotDeger = deger!;
              widget.onHarfSecildi(deger);
            });
          },
        ));
  }
}
