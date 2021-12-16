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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'testOn.getSorumetni(soruIndex)',
                textAlign: TextAlign.center,
                style: TextStyle(
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
                        setState(() {
                          testOn.getSoruYanitlari() == false
                              ? secimler.add(kDogru)
                              : secimler.add(kYanlis);
                          testOn.soruBankIndex();
                        });
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
                        setState(() {
                          testOn.getSoruYanitlari() == true
                              ? secimler.add(kDogru)
                              : secimler.add(kYanlis);
                          testOn.soruBankIndex();
                        });
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
