import 'package:flutter/material.dart';
import 'package:bookland/baslik.dart';
import 'menuIconSayfasi.dart';
import 'kitapDetay.dart';

class KategoriDetay extends StatelessWidget {
  final String kategoriEtiketi;
  KategoriDetay(this.kategoriEtiketi);

  final List<Map> ayrintilar = [
    {
      "isim": "Nitche Ağladıkça",
      "fotograf": "assets/images/nitche.jpg",
      "yazar": 'Irvin D. Yalom',
      "onsoz": " s "
    },
    {
      "isim": "Yabancı",
      "fotograf": "assets/images/yabanci.jpg",
      "yazar": "Albert Camus",
      "onsoz": " s "
    },
    {
      "isim": "Böyle Buyurdu Zerdüşt",
      "fotograf": "assets/images/zerdüşt.jpg",
      "yazar": "Friedrich Nitche",
      "onsoz": " s "
    },
    {
      "isim": "Sapiens",
      "fotograf": "assets/images/sapiens.jpg",
      "yazar": "Yuval Noah Harrari",
      "onsoz": " s "
    },
    {
      "isim": "Bozkırkurdu",
      "fotograf": "assets/images/bozkırkurdu.jpg",
      "yazar": "Herman Hesse",
      "onsoz": " s "
    },
    {
      "isim": "Savaş Sanatı",
      "fotograf": "assets/images/savassanati.jpg",
      "yazar": "Sun Tzu",
      "onsoz": " s "
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  baslik(kategoriEtiketi, context),
                  SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: ayrintilar.map((Map ayrintilar) {
                        return katalog(
                            ayrintilar["isim"],
                            ayrintilar["fotograf"],
                            ayrintilar["yazar"],
                            ayrintilar["önsöz"],
                            context);
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            menuIconSayfasi("kategoriDetay"),
          ],
        ),
      ),
    );
  }
}

Widget katalog(
    String kitapadi, String fotografUrl, String yazar, String onsoz, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return kitapDetay(kitapadi);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.brown.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 16)),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Image.asset(
            fotografUrl,
            scale: 5,
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kitapadi,
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                yazar,
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
