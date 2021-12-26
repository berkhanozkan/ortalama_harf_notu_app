import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropdownWidget({Key? key, required this.onKrediSecildi})
      : super(key: key);

  @override
  _KrediDropdownWidgetState createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKrediDeger = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // margin: EdgeInsets.all(10),
      // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100,
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        items: DropdownHelper.buildDropdownKredi(),
        onChanged: (deger) {
          setState(() {
            secilenKrediDeger = deger!;
            widget.onKrediSecildi(secilenKrediDeger);
          });
        },
        value: secilenKrediDeger,
      ),
    );
  }
}
