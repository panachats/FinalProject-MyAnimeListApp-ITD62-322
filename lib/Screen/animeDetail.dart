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
      body: Stack(
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
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
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
              child: Card(
            color: Color(0xFF151f2e),
            margin: EdgeInsets.all(20),
            child: SingleChildScrollView(
              // ปรับความสูงของ ListView
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Type: ${type}",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      subtitle ?? '',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  // เพิ่ม Widgets อื่น ๆ ตามต้องการ
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
