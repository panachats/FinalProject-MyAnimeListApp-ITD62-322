// To parse this JSON data, do
//
//    final usersApi = usersApiFromJson(jsonString);

import 'dart:convert';

List<UsersApi> usersApiFromJson(String str) => List<UsersApi>.from(json.decode(str).map((x) => UsersApi.fromJson(x)));

String usersApiToJson(List<UsersApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersApi {
    String? uId;
    String? username;
    String? password;
    List<Anime>? anime;
    List<dynamic>? manga;

    UsersApi({
        this.uId,
        this.username,
        this.password,
        this.anime,
        this.manga,
    });

    factory UsersApi.fromJson(Map<String, dynamic> json) => UsersApi(
        uId: json["u_id"],
        username: json["username"],
        password: json["password"],
        anime: json["anime"] == null ? [] : List<Anime>.from(json["anime"]!.map((x) => Anime.fromJson(x))),
        manga: json["manga"] == null ? [] : List<dynamic>.from(json["manga"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "u_id": uId,
        "username": username,
        "password": password,
        "anime": anime == null ? [] : List<dynamic>.from(anime!.map((x) => x.toJson())),
        "manga": manga == null ? [] : List<dynamic>.from(manga!.map((x) => x)),
    };
}

class Anime {
    String? aId;
    String? img;
    String? title;
    String? type;
    String? ep;

    Anime({
        this.aId,
        this.img,
        this.title,
        this.type,
        this.ep,
    });

    factory Anime.fromJson(Map<String, dynamic> json) => Anime(
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
