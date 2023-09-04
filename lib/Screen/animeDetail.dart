import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;

  Details({
    this.imageUrl,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(imageUrl ?? ''),
          ),
          ListTile(
            title: Text(
              title ?? '',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              "Category",
              style: TextStyle(color: Colors.grey),
            ),
            subtitle: Text(
              subtitle ?? '', // เพิ่ม subtitle ที่คุณต้องการแสดง
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          // เพิ่ม Widgets อื่น ๆ ตามต้องการ
        ],
      ),
    );
  }
}
