import 'dart:convert';

JokeModel jokeModelFromJson(String str) => JokeModel.fromJson(json.decode(str));

String jokeModelToJson(JokeModel data) => json.encode(data.toJson());

class JokeModel {
  final String? setup;
  final String? delivery;
  final int? id;

  JokeModel({
    this.setup,
    this.delivery,
    this.id,
  });

  factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
    setup: json['setup'],
    delivery: json['delivery'],
    id: json['id'],
  );

  Map<String, dynamic> toJson() => {
    'setup': setup,
    'delivery': delivery,
    'id': id,
  };
}