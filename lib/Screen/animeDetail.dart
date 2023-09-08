import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application/modules/configure.dart';

class Details extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final String? type;
  final String? description;
  final String? ep;
  final String? id;

  Details({
    this.imageUrl,
    this.title,
    this.subtitle,
    this.type,
    this.description,
    this.ep,
    this.id,
  });

  Future<void> postAnimeData(newAnimeData) async {
    var url = Uri.http(Configure.server, 'myList');
    var resp = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newAnimeData));
    print(newAnimeData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B1622),
      appBar: AppBar(
        title: Text(title ?? ''),
        backgroundColor: Color(0xFF2b2d42),
      ),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      imageUrl ?? '',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 195,
                    height: 260,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        imageUrl ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 330, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Type: ${type}",
                                style: TextStyle(
                                  color: Color(0XFF8a919c),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF151f2e),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('$ep ${type == 'anime' ? 'Episodes':'Chapters'}',
                                style: TextStyle(
                                  color: Color(0XFF8a919c),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF151f2e),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                postAnimeData({
                                  "uid": Configure.uid,
                                  "${type != 'manga' ? 'aid' : 'mid'}": id,
                                  "img": imageUrl,
                                  "title": title,
                                  "description": description,
                                  "type": type,
                                  "ep": ep,
                                  "progress": '1'
                                });
                                print("TEstttttttttt");
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.star_border_sharp,
                                  color: Colors.white,
                                  size: lerpDouble(30, 30, 30),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      padding: EdgeInsets.fromLTRB(0, 0, 290, 0),
                      child: Text(
                        "Description",
                        style: TextStyle(color: Color(0XFF8a919c)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Card(
                        color: Color(0xFF151f2e),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                description ?? "",
                                style: TextStyle(color: Color(0XFF8a919c)),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
