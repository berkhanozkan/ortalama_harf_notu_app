import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';
import 'package:ortalama_hesapla/widgets/ders_listesi.dart';
import 'package:ortalama_hesapla/widgets/harf_dropdown_widget.dart';
import 'package:ortalama_hesapla/widgets/kredi_dropdown_widget.dart';
import 'package:ortalama_hesapla/widgets/ortalama_goster.dart';

import 'constants/app_constants.dart';
import 'model/ders.dart';

class DinamikOrtalamaHesaplaPage extends StatefulWidget {
  const DinamikOrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _DinamikOrtalamaHesaplaPageState createState() =>
      _DinamikOrtalamaHesaplaPageState();
}

class _DinamikOrtalamaHesaplaPageState
    extends State<DinamikOrtalamaHesaplaPage> {
      
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfNotDeger = 4;
  double secilenKrediDeger = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          leading: Icon(
            Icons.calculate_rounded,
            color: Sabitler.anaRenk,
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            Sabitler.baslik,
            style: Sabitler.baslikStyle,
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildForm(),
                  flex: 2,
                ),
                Expanded(
                  child: OrtalamaGosterWidget(
                      dersSayisi: DropdownHelper.tumEklenenDersler.length,
                      ortalama: DropdownHelper.OrtalamaHesapla()),
                  flex: 1,
                )
              ],
            ),
            Expanded(
              child: DersListesi(onDismiss: (index) {
                //oluşturulan callback fonksiyonu burada kullanıldı.setstate denilerek son
                // güncel hali build edilmiş oldu.
                DropdownHelper.tumEklenenDersler.removeAt(index);
                
                setState(() {});
              }),
            )
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Text('Harf Notu'),
                        HarfDropdownWidget(
                          onHarfSecildi: (harf) {
                            secilenHarfNotDeger = harf;
                          },
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Text('Kredi'),
                        KrediDropdownWidget(onKrediSecildi: (kredi) {
                          secilenKrediDeger = kredi;
                        }),
                      ],
                    )),
              ),
              Expanded(
                child: IconButton(
                  onPressed: _btnOrtalamaHesapla,
                  icon: Icon(Icons.arrow_forward_ios_sharp),
                  color: Sabitler.anaRenk,
                  iconSize: 32,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (ders) {
        setState(() {
          girilenDersAdi = ders!;
        });
      },
      validator: (ders) {
        if (ders!.length <= 0) {
          return 'Ders giriniz !';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: 'Matematik',
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100),
    );
  }

  void _btnOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      var eklenecekDersBilgileri = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfNotDeger,
          krediDegeri: secilenKrediDeger);

      setState(() {
        DropdownHelper.dersEkle(eklenecekDersBilgileri);
      });
    }
  }
}
