import 'package:bookland/data/okunacaklar_servis.dart';
import 'package:bookland/models/okunacaklar.dart';
import 'package:flutter/material.dart';
import 'okunacaklar_sayfasi.dart';

class OkunacaklarListesi extends StatefulWidget {
  @override
  _OkunacaklarListesiState createState() => _OkunacaklarListesiState();
}

class _OkunacaklarListesiState extends State<OkunacaklarListesi> {
  OkunacaklarServis service = OkunacaklarServis.instance;
  List<Okunacaklar> okunacaklar = [];
  List<Okunacaklar> okunanlar = [];

  @override
  void initState() {
    veriYukle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text("Okunacak Kitaplar"),
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.check_box_outline_blank),
            ),
            Tab(
              icon: Icon(Icons.check),
            ),
          ],
        ),
      ),
      body: TabBarView(children: [
        getirOkunacaklarListesi(okunacaklar),
        getirOkunacaklarListesi(okunanlar),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (_) => OkunacaklarSayfasi()))
              .then((value) => veriYukle());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getirOkunacaklarListesi(List<Okunacaklar> todos) {
    return todos.length == 0
        ? Center(child: Text("veri yok"))
        : ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  trailing: Checkbox(
                    onChanged: (value) {
                      todos[index].yapildiMi = value;
                      service
                          .guncelleOkunanlari(todos[index])
                          .then((value) => veriYukle());
                    },
                    activeColor: Colors.brown,
                    value: todos[index].yapildiMi,
                  ),
                  title: Text(todos[index].kitapAdi),
                  subtitle: Text(todos[index].aciklama),
                ),
              );
            },
          );
  }

  veriYukle() {
    service.getirOkunacaklar(true).then((value) {
      setState(() {
        okunacaklar = value;
      });
    });
    service.getirOkunacaklar(false).then((value) {
      setState(() {
        okunanlar = value;
      });
    });
  }
}
