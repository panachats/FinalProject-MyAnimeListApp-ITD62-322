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



//My List from json to class #######################################
List<MyListData> myListDataFromJson(String str) => List<MyListData>.from(json.decode(str).map((x) => MyListData.fromJson(x)));

String myListDataToJson(List<MyListData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyListData {
    String? uid;
    String? aid;
    String? img;
    String? title;
    String? type;
    String? ep;
    String? progress;
    int? id;

    MyListData({
        this.uid,
        this.aid,
        this.img,
        this.title,
        this.type,
        this.ep,
        this.progress,
        this.id,
    });

    factory MyListData.fromJson(Map<String, dynamic> json) => MyListData(
        uid: json["uid"],
        aid: json["aid"],
        img: json["img"],
        title: json["title"],
        type: json["type"],
        ep: json["ep"],
        progress: json["progress"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "aid": aid,
        "img": img,
        "title": title,
        "type": type,
        "ep": ep,
        "progress": progress,
        "id": id,
    };
}
