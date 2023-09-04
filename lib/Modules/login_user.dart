// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  String? id;
  String? username;
  String? email;
  String? password;
  List<dynamic>? anime;
  List<dynamic>? manga;

  Users({
    this.id,
    this.username,
    this.email,
    this.password,
    this.anime,
    this.manga,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        anime: json["anime"] == null
            ? []
            : List<dynamic>.from(json["anime"]!.map((x) => x)),
        manga: json["manga"] == null
            ? []
            : List<dynamic>.from(json["manga"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "anime": anime == null ? [] : List<dynamic>.from(anime!.map((x) => x)),
        "manga": manga == null ? [] : List<dynamic>.from(manga!.map((x) => x)),
      };
}
