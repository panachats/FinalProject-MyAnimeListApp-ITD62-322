import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_application/Modules/configure.dart';

class Details extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final String? type;
  final String? description;
  final String? ep;

  Details({
    this.imageUrl,
    this.title,
    this.subtitle,
    this.type,
    this.description,
    this.ep,
  });

  Future<void> getDetail() async {
    var url = Uri.https('${Configure.server}');
    var response =
        await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
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
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 330, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // จัดตำแหน่ง Row อยู่ตรงกลาง
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Align(
                                alignment: Alignment
                                    .center, // จัดให้ข้อความอยู่ตรงกลาง
                                child: Text(
                                  "Type: ${type}",
                                  style: TextStyle(
                                      color: Color(0XFF8a919c),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xFF151f2e),
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    ep ?? '',
                                    style: TextStyle(
                                        color: Color(0XFF8a919c),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xFF151f2e),
                                    borderRadius: BorderRadius.circular(5.0))),

                            // Container(
                            //   margin: EdgeInsets.all(5),
                            //   child: Align(
                            //       alignment: Alignment.center,
                            //       child: Icon(
                            //         Icons.star_border_sharp,
                            //         color: Colors.white,
                            //         size: lerpDouble(30, 30, 30),
                            //       )),
                            //   height: 50,
                            //   width: 100,
                            //   decoration: BoxDecoration(
                            //       color: Color(0xFFec294b),
                            //       borderRadius: BorderRadius.circular(5.0)),
                            // ),

                            SizedBox(
                              height: 50,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {getDetail();},
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.star_border_sharp,
                                      color: Colors.white,
                                      size: lerpDouble(30, 30, 30),
                                    )),
                              ),
                            )
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
        ));
  }
}
