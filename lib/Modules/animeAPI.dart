// To parse this JSON data, do
//
//     final animeApi = animeApiFromJson(jsonString);

import 'dart:convert';

List<AnimeApi> animeApiFromJson(String str) =>
    List<AnimeApi>.from(json.decode(str).map((x) => AnimeApi.fromJson(x)));

String animeApiToJson(List<AnimeApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimeApi {
  String? id;
  String? img;
  String? title;
  String? description;
  String? type;
  String? ep;

  AnimeApi({
    this.id,
    this.img,
    this.title,
    this.description,
    this.type,
    this.ep,
  });

  factory AnimeApi.fromJson(Map<String, dynamic> json) => AnimeApi(
        id: json["id"],
        img: json["img"],
        title: json["title"],
        description: json["description"],
        type: json["type"],
        ep: json["ep"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
        "title": title,
        "description": description,
        "type": type,
        "ep": ep,
      };
}
