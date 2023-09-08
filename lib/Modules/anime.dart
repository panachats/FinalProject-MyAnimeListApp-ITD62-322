import 'package:flutter/material.dart';
import 'animeAPI.dart';
import 'configure.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/screen/animeDetail.dart';

class Anime extends StatefulWidget {
  const Anime({Key? key});

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> {
  List<AnimeApi> animesAPI = [];
  @override
  void initState() {
    super.initState();
    getAnime();
  }

  Future<void> getAnime() async {
    var url = Uri.http(Configure.server, "anime");
    var response = await http.get(url);
    print(response.body);
    setState(() {
      animesAPI = animeApiFromJson(response.body);
    });
    return;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B1622),
      body: showAll(context, animesAPI), // เรียกใช้ฟังก์ชัน showAll
    );
  }

  // แก้ไข buildCustomCard ให้รับพารามิเตอร์ context
}

class AnimeD {
  String? imageUrl;
  String? title;
  String? subtitle;
  String? type;
  String? description;
  String? ep;

  AnimeD({
    this.imageUrl,
    this.title,
    this.subtitle,
    this.type,
    this.description,
    this.ep,
  });
}

Widget buildCustomCard(
  BuildContext context,
  String imageUrl,
  String title,
  String subtitle,
  String type,
  String description,
  String ep,
) {
  var screen_width = MediaQuery.of(context).size.width;
  double margin_px = 10.0;
  var widthCard = (screen_width - (margin_px * 6)) / 3;

  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Details(
            imageUrl: imageUrl,
            title: title,
            subtitle: subtitle,
            type: type,
            description: description,
            ep: ep,
          ),
        ),
      );
    },
    child: Card(
      color: Color(0xFF0b1622),
      margin: EdgeInsets.fromLTRB(margin_px, margin_px, 3, margin_px),
      elevation: 0.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: widthCard,
            height: 180, // ปรับความสูงของรูป
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: FittedBox(
                fit: BoxFit
                    .cover, // รูปจะแสดงพอดีกับความสูงและความกว้างของ SizedBox
                child: Image.network(
                  imageUrl,
                ),
              ),
            ),
          ),
          SizedBox(
            width: widthCard,
            child: Container(
              color: Color(0xFF0b1622),
              child: ListTile(
                title: Text(
                  title,
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(subtitle,
                    style: TextStyle(fontSize: 13.0, color: Color(0XFF8a919c))),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget showAll(BuildContext context, animesAPI) {
  return ListView.builder(
    itemCount: (animesAPI.length / 3).ceil(),
    itemBuilder: (context, rowIndex) {
      int startIndex = rowIndex * 3;
      int endIndex = (rowIndex + 1) * 3;
      if (endIndex > animesAPI.length) {
        endIndex = animesAPI.length;
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (rowIndex == 0)
            Text("TRENDING NOW",
                style: const TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              for (int i = startIndex; i < endIndex; i++)
                Expanded(
                    child: buildCustomCard(
                        context,
                        animesAPI[i].img!,
                        '${animesAPI[i].title}',
                        '${animesAPI[i].type != 'manga' ? animesAPI[i].ep + ' Episodes' : animesAPI[i].cpt + ' Chapters'}',
                        '${animesAPI[i].type}',
                        '${animesAPI[i].description}',
                        '${animesAPI[i].type != 'manga' ? animesAPI[i].ep : animesAPI[i].cpt}')),
            ],
          ),
        ],
      );
    },
  );
}
