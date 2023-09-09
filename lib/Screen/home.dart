import 'package:flutter/material.dart';
import 'package:flutter_application/modules/anime.dart';
import 'package:flutter_application/modules/manga.dart';
import 'package:flutter_application/modules/sideBar.dart';

class Home extends StatefulWidget {
  static const routeName = "/";
  
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2, // จำนวนแท็บ
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tab(icon: Icon(Icons.tv)),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Anime",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tab(icon: Icon(Icons.book)),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Manga",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          title: const Text("Home"),
          backgroundColor: Color(0xFF2b2d42),
        ),
        drawer: SideMenu(),
        body: TabBarView(
          children: [
            Anime(), // เนื้อหาของแท็บที่ 1
            Manga(), // เนื้อหาของแท็บที่ 1
          ],
        ),
      ),
    );
  }
}
