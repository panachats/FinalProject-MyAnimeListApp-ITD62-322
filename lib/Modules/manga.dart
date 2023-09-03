import 'package:flutter/material.dart';

class Manga extends StatelessWidget {
  const Manga({super.key});

  Widget buildCustomCard(
      BuildContext context, String imageUrl, String title, String subtitle) {
    var screen_width = MediaQuery.of(context).size.width;
    double margin_px = 10.0;
    var widthCard = (screen_width - (margin_px * 6)) / 3;
    return Card(
      margin: EdgeInsets.fromLTRB(margin_px, margin_px, 3, margin_px),
      elevation: 0.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: widthCard,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                imageUrl,
                width: 160,
                height: 180,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            width: widthCard,
            child: Container(
              color: Color(0xFFfafafa),
              child: ListTile(
                title: Text(
                  title,
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF8a919c) // ทำให้ Text ตัวหนา
                      ),
                ),
                subtitle: Text(
                  subtitle,
                  style: TextStyle(fontSize: 13.0),
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showAll(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Text("TRENDING NOW",
            style: const TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/manga/2/253146.jpg',
              'One Piece',
              '1030 Chapters',
            ),
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/manga/3/179023.jpg',
              'Kimetsu no Yaiba',
              '207 Chapters',
            ),
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/manga/2/37846.jpg',
              'Shingeki no Kyojin',
              '141 Chapters',
            ),
          ],
        ),
        Row(
          children: [
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/manga/4/280766.jpg',
              'Slam Dunk',
              '276 Chapters',
            ),
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/manga/3/179882.jpg',
              'JoJo no Kimyou na Bouken Part 7: Steel Ball Run',
              '96 Chapters',
            ),
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/manga/2/54453l.jpg',
              'Death Note',
              '108 Chapters',
            ),
          ],
        ), // สร้าง Rows อื่น ๆ ได้ตามต้องการ
        Row(
          children: [
            buildCustomCard(
              context,
              'https://shop.delivered.co.kr/cdn/shop/products/loverevolutionmanhwabookvolume24koreanversiondkshop.jpg?v=1679834308',
              'Love Revolution ',
              '437 Chapters',
            ),
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/manga/1/227594.jpg',
              'Solo Leveling',
              '201 Chapters',
            ),
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/manga/2/223694.jpg',
              'Tower of God',
              '563 Chapters',
            ),
          ],
        ), // สร้าง Rows อื่น ๆ ได้ตามต้องการ
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return showAll(context);
  }
}
