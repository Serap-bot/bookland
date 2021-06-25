import 'package:animator/animator.dart';
import 'package:bookland/sabitler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'kitapEkleme.dart';

class favoriKitap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Kutuphane(title: 'Kutuphane'),
    );
  }
}

class Kutuphane extends StatefulWidget {
  Kutuphane({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _KutuphaneState createState() => _KutuphaneState();
}

class _KutuphaneState extends State<Kutuphane> {
  TextEditingController kitapadiController = TextEditingController();
  TextEditingController yazaradiController = TextEditingController();

  var map;
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var kitaplarRef = _firestore.collection("Kutuphane");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder(
            stream: kitaplarRef.snapshots(),
            builder: (BuildContext context, AsyncSnapshot asyncsnapshot) {
              if (asyncsnapshot.hasError) {
                return Center(
                  child: Text("Bir hata oluştu"),
                );
              } else {
                if (asyncsnapshot.hasData) {
                  List listOfDocumentSnap = asyncsnapshot.data.docs;
                  return Flexible(
                    child: ListView.builder(
                      itemCount: listOfDocumentSnap.length,
                      itemBuilder: (context, index) {
                        return Card(
                            color: Colors.brown[400],
                            child: ListTile(
                              onLongPress: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => kitapEkleme(
                                            listOfDocumentSnap, index)));
                              },
                              subtitle: Text(
                                  "${listOfDocumentSnap[index].data()["Yazar Adi"]}"),
                              isThreeLine: true,
                              trailing: Animator(
                                tween: Tween<double>(begin: 1, end: 0),
                                builder: (context, state, child) {
                                  return FractionalTranslation(
                                      child: child,
                                      translation: Offset(state.value, 0));
                                },
                                child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      await listOfDocumentSnap[index]
                                          .reference
                                          .delete();
                                    }),
                              ),
                              /*leading: IconButton(
                                  icon: Icon(Icons.add), onPressed: () {}),*/
                              title: Text(
                                  "${listOfDocumentSnap[index].data()["Kitap Adi"]}",
                                  style: kMetinStili),
                            ));
                      },
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                    controller: kitapadiController,
                    decoration: InputDecoration(hintText: "Kitap Adi")),
                TextFormField(
                    controller: yazaradiController,
                    decoration: InputDecoration(hintText: "Yazar Adi")),
              ],
            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
        onPressed: () async {
          Map<String, dynamic> kitapVeri = {
            "Kitap Adi": kitapadiController.text,
            "Yazar Adi": yazaradiController.text
          };
          await kitaplarRef.doc(kitapadiController.text).set(kitapVeri);
        },
      ),
    );
  }
}
