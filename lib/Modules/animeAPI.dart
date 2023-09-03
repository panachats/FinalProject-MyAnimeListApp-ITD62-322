// To parse this JSON data, do
//
//     final animeApi = animeApiFromJson(jsonString);

import 'dart:convert';

List<AnimeApi> animeApiFromJson(String str) =>
    List<AnimeApi>.from(json.decode(str).map((x) => AnimeApi.fromJson(x)));

String animeApiToJson(List<AnimeApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimeApi {
  String? aId;
  String? img;
  String? title;
  String? type;
  String? ep;

  AnimeApi({
    this.aId,
    this.img,
    this.title,
    this.type,
    this.ep,
  });

  factory AnimeApi.fromJson(Map<String, dynamic> json) => AnimeApi(
        aId: json["a_id"],
        img: json["img"],
        title: json["title"],
        type: json["type"],
        ep: json["ep"],
      );

  Map<String, dynamic> toJson() => {
        "a_id": aId,
        "img": img,
        "title": title,
        "type": type,
        "ep": ep,
      };
}
