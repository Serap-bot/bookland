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
          padding: const EdgeInsets.all(18.0),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buton() => RaisedButton(
      child: Text("Giris Yap"),
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
