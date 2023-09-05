// To parse this JSON data, do
//
//     final mangaApi = mangaApiFromJson(jsonString);

import 'dart:convert';

List<MangaApi> mangaApiFromJson(String str) =>
    List<MangaApi>.from(json.decode(str).map((x) => MangaApi.fromJson(x)));

String mangaApiToJson(List<MangaApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MangaApi {
  String? id;
  String? img;
  String? title;
  String? description;
  String? type;
  String? cpt;

  MangaApi({
    this.id,
    this.img,
    this.title,
    this.description,
    this.type,
    this.cpt,
  });

  factory MangaApi.fromJson(Map<String, dynamic> json) => MangaApi(
        id: json["id"],
        img: json["img"],
        title: json["title"],
        description: json["description"],
        type: json["type"],
        cpt: json["cpt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
        "title": title,
        "description": description,
        "type": type,
        "cpt": cpt,
      };
}
