import 'package:bilgi_yarismasi/sorular.dart';

class TestVeriler {
  int _soruIndex = 0;

  final List<Soru> _soruBankasi = [
    Soru(
        soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir', soruYaniti: false),
    Soru(
        soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
        soruYaniti: true),
    Soru(soruMetni: 'Kelebeklerin ömrü bir gündür', soruYaniti: false),
    Soru(soruMetni: 'Dünya düzdür', soruYaniti: false),
    Soru(
        soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır',
        soruYaniti: true),
    Soru(
        soruMetni: 'Fatih Sultan Mehmet hiç patates yemmemiştir',
        soruYaniti: true)
  ];

  String getSorumetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYanitlari() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void soruBankIndex() {
    if (_soruIndex < _soruBankasi.length - 1) {
      _soruIndex++;
    }
  }
}
