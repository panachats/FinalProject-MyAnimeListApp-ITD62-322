// To parse this JSON data, do
//
//     final mangaApi = mangaApiFromJson(jsonString);

import 'dart:convert';

List<MangaApi> mangaApiFromJson(String str) =>
    List<MangaApi>.from(json.decode(str).map((x) => MangaApi.fromJson(x)));

String mangaApiToJson(List<MangaApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MangaApi {
  String? mId;
  String? img;
  String? title;
  String? type;
  String? cpt;

  MangaApi({
    this.mId,
    this.img,
    this.title,
    this.type,
    this.cpt,
  });

  factory MangaApi.fromJson(Map<String, dynamic> json) => MangaApi(
        mId: json["m_id"],
        img: json["img"],
        title: json["title"],
        type: json["type"],
        cpt: json["cpt"],
      );

  Map<String, dynamic> toJson() => {
        "m_id": mId,
        "img": img,
        "title": title,
        "type": type,
        "cpt": cpt,
      };
}
