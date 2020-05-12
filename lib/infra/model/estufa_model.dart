import 'package:firebase_database/firebase_database.dart';

class EstufaModel {
  String key;
  bool exaustor;
  bool irrigador;
  bool luz;
  int temperatura;
  int umidade;

  EstufaModel(
      this.exaustor, this.irrigador, this.luz, this.temperatura, this.umidade);

  EstufaModel.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        exaustor = snapshot.value["exaustor"],
        irrigador = snapshot.value["irrigador"],
        luz = snapshot.value["luz"],
        temperatura = snapshot.value["temperatura"],
        umidade = snapshot.value["umidade"];

  toJson() => {
        'exaustor': exaustor,
        'irrigador': irrigador,
        'luz': luz,
        'temperatura': temperatura,
        'umidade': umidade,
      };
}
