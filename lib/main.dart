import 'package:bilgi_yarismasi/test_veriler.dart';
import 'package:flutter/material.dart';

import 'constans.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  TestVeriler testOn = TestVeriler();

  void sorular() {
    testOn.getSorumetni();
  }

  void buttomFucsion(bool secilenBtn) {
    if (testOn.sonSoruIndex() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white60,
            title: const Text('Test Bitti !'),
            content: const Text('Sorular bitti tekrar başlatmak için '),
            actions: <Widget>[
              TextButton(
                child: const Text('Evet'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  setState(() {
                    secimler = [];
                    testOn.testiSifirla();
                  });
                },
              )
            ],
          );
        },
      );
    } else {
      setState(() {
        testOn.getSoruYanitlari() == secilenBtn
            ? secimler.add(kDogru)
            : secimler.add(kYanlis);
        testOn.soruBankIndex();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                testOn.getSorumetni().toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          runSpacing: 3,
          spacing: 3,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: const Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        buttomFucsion(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.green[400],
                      child: const Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        buttomFucsion(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
