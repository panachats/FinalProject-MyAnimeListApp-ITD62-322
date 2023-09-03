import 'package:flutter/material.dart';

class Anime extends StatelessWidget {
  const Anime({Key? key});

  Widget buildCustomCard(
      BuildContext context, String imageUrl, String title, String subtitle) {
    var screen_width = MediaQuery.of(context).size.width;
    // var screen_height = MediaQuery.of(context).size.height;
    // คำนวณ widthCard ในฟังก์ชัน buildCustomCard
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
                subtitle: Text(subtitle, style: TextStyle(fontSize: 13.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // แก้ไข showAll โดยเพิ่ม context เป็นพารามิเตอร์
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
              'https://cdn.myanimelist.net/images/anime/1582/132441l.jpg',
              'Zom 100: Zombie ni Naru Made ni Shitai 100 no Koto',
              '23 Episodes',
            ),
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/anime/1792/138022.jpg',
              'Jujutsu Kaisen 2nd Season',
              '13 Episodes',
            ),
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/anime/1764/126627.jpg',
              'Bleach: Sennen Kessen-hen',
              '13 Episodes',
            ),
          ],
        ),
        Row(
          children: [
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/anime/1818/126435.jpg',
              'Cyberpunk: Edgerunners',
              '10 Episodes',
            ),
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/anime/1973/133295.jpg',
              'Kidou Senshi Gundam: Suisei no Majo Season 2',
              '12 Episodes',
            ),
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/anime/1806/126216.jpg',
              'Chainsaw Man',
              '12 Episodes',
            ),
          ],
        ), // สร้าง Rows อื่น ๆ ได้ตามต้องการ
        Row(
          children: [
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/anime/1028/125506l.jpg',
              'Shingeki no Kyojin: The Final Season Part 2',
              '12 Episodes',
            ),
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/anime/1449/117797.jpg',
              'Takt Op. Destiny',
              '12 Episodes',
            ),
            buildCustomCard(
              context,
              'https://cdn.myanimelist.net/images/anime/1422/113533.jpg',
              'Evangelion: 3.0+1.0 Thrice Upon a Time',
              '1 Episodes',
            ),
          ],
        ), // สร้าง Rows อื่น ๆ ได้ตามต้องการ
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return showAll(context); // ส่ง context เข้าไปใน showAll
  }
}
