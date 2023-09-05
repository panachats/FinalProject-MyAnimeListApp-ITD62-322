import 'dart:ui';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final String? type;
  final String? description;

  Details({
    this.imageUrl,
    this.title,
    this.subtitle,
    this.type,
    this.description,
  });

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
                  height: 250, // ปรับความสูงของรูปภาพหลัก
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
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
                Positioned(
                  top: 40, // ปรับตำแหน่งรูปภาพที่อยู่กลาง
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 195,
                      height: 260, // ปรับความสูงของรูปภาพที่อยู่กลาง
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 450, 0, 0),
                      padding: EdgeInsets.fromLTRB(0, 0, 290, 0),
                      child: Text(
                        "Description",
                        style: TextStyle(color: Colors.amber),
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
              ],
            ),
          ],
        ));
  }
}
