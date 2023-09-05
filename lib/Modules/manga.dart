import 'package:flutter/material.dart';
import 'anime.dart';
import 'mangaAPI.dart';
import 'configure.dart';
import 'package:http/http.dart' as http;

class Manga extends StatefulWidget {
  const Manga({super.key});

  @override
  State<Manga> createState() => _MangaState();
}

class _MangaState extends State<Manga> {
  List<MangaApi> mangasAPI = [];
  @override
  void initState() {
    super.initState();
    getManga();
  }

  Future<void> getManga() async {
    var url = Uri.http(Configure.server, "manga");
    var response = await http.get(url);
    print(response.body);
    setState(() {
      mangasAPI = mangaApiFromJson(response.body);
    });
    return;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0B1622), body: showAll(context, mangasAPI));
  }
}
