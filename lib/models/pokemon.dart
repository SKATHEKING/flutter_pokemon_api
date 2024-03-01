// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Result pokemonFromJson(String str) => Result.fromJson(json.decode(str));

String pokemonToJson(Result data) => json.encode(data.toJson());

class Result {
  Result({
    required this.count,
    required this.next,
    this.previous,
    required this.results
  });

  int count;
  String? next;
  dynamic previous;
  List<Pokemon> results;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Pokemon>.from(json["results"].map((x) => Pokemon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Pokemon {
  Pokemon({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
