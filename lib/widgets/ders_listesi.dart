import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';
import 'package:ortalama_hesapla/model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function
      onDismiss; //farklı widgetlar arasında data iletişimi için bu fonksyon yapıları kullanılır. İlgili widgetda fonksiyon ouşturulur.

  const DersListesi({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DropdownHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDismiss(
                      index); // manuel oluştuurlan callback fonksiyonu. farklı widgetlar arasında iletişimi sağlar.
                },
                child: Card(
                  child: ListTile(
                    title: Text(tumDersler[index].ad),
                    subtitle: Text(
                        '${tumDersler[index].krediDegeri} Kredi, Not Değeri : ${tumDersler[index].harfDegeri}'),
                    leading: CircleAvatar(
                      backgroundColor: Sabitler.anaRenk.shade100,
                      child: Text((tumDersler[index].harfDegeri *
                              tumDersler[index].krediDegeri)
                          .toStringAsFixed(0)),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
              child: Text(
                'Ders Listesi Boş',
                style: Sabitler.baslikStyle,
              ),
            ),
          );
  }
}
