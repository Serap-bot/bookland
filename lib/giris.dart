import 'package:bookland/pages/hakkinda.dart';
import 'package:flutter/material.dart';
import 'package:bookland/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String kullaniciAdi;
  String sifre;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Kullanici Adi "),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Kullanici Adi Giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  kullaniciAdi = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Sifre"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Sifrenizi Giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  sifre = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              _buton(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return hakkinda();
                      },
                    ),
                  );
                },
                child: Container(
                  width: 90,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.brown,
                  ),
                  child: Text(
                    'Hakkında',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buton() => RaisedButton(
      child: Text(
        "Giris",
        style: TextStyle(color: Colors.brown, fontSize: 18),
      ),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                kullaniciAdi: kullaniciAdi,
              ),
            ),
          );
        }
      });
}
