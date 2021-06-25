import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class hakkinda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Uygulama Hakkında"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 203311092 numaralı Serap BEKAR tarafından 25 Haziran 2021 günü yapılmıştır.",
            style: TextStyle(color: Colors.brown, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
