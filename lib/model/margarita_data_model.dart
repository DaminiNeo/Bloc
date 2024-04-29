// To parse this JSON data, do
//
//     final margarita = margaritaFromJson(jsonString);

import 'dart:convert';

Margarita margaritaFromJson(String str) => Margarita.fromJson(json.decode(str));

String margaritaToJson(Margarita data) => json.encode(data.toJson());

class Margarita {
  final List<Map<String, String?>> drinks;

  Margarita({
    required this.drinks,
  });

  factory Margarita.fromJson(Map<String, dynamic> json) => Margarita(
        drinks: List<Map<String, String?>>.from(json['drinks'].map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
      );

  Map<String, dynamic> toJson() => {
        'drinks': List<dynamic>.from(drinks.map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
      };
}
