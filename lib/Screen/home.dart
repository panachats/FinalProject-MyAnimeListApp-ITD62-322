import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const rountName = "/";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Color(0xFF2b2d42),
      ),
      drawer: SideMenu(),
      body: showAll(),
    );
  }

  Widget buildCustomCard(String imageUrl, String title, String subtitle) {
    var screen_width = MediaQuery.of(context).size.width;
    var screen_height = MediaQuery.of(context).size.height;
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
                ),
                subtitle: Text(subtitle, style: TextStyle(fontSize: 13.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showAll() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Text("TRENDING NOW",
            style: const TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            buildCustomCard(
              'https://cdn.myanimelist.net/images/anime/1582/132441l.jpg',
              'Zom 100: Zombie ni Naru Made ni Shitai 100 no Koto',
              'Current Ep: 9',
            ),
            buildCustomCard(
              'https://cdn.myanimelist.net/images/anime/1792/138022.jpg',
              'Jujutsu Kaisen 2nd Season',
              'Current Ep: 7',
            ),
            buildCustomCard(
              'https://cdn.myanimelist.net/images/anime/1764/126627.jpg',
              'Bleach: Sennen Kessen-hen',
              'Current Ep: 10',
            ),
          ],
        ),
        // สร้าง Rows อื่น ๆ ได้ตามต้องการ
      ],
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    String accountName = "test test";
    String accountEmail = "test@gmail.com";
    String accountUrl =
        "https://scontent-sin6-2.xx.fbcdn.net/v/t39.30808-6/273413990_3119201128311439_2672481491856375976_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=1b51e3&_nc_eui2=AeGWnfORO60ye94wvck_8KdVpJC9kVvTwr-kkL2RW9PCv0xmqzUevqW1puphlhulX1m4q9B2FMf5YwceaWMwUHd4&_nc_ohc=Dk_EP91hE74AX8HUG6i&_nc_ht=scontent-sin6-2.xx&oh=00_AfCmxWrrO4rPBEeb3Bzxf-Db9KCw1uSWRy7VDRaVCqhfpQ&oe=64F69D10";
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(accountName),
            accountEmail: Text(accountEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(accountUrl),
              backgroundColor: Colors.white,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://scontent-sin6-1.xx.fbcdn.net/v/t39.30808-6/322702899_1309988606508692_3720454098225593822_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=52f669&_nc_eui2=AeGTkwRmpvnX-lpQptK160juIjjQMyMQQQkiONAzIxBBCSkaHa_PQDacbSccRtr5Q88PyCCr9v5wT_GHOHOlOUd1&_nc_ohc=5tvongCeNLYAX_gdx4S&_nc_ht=scontent-sin6-1.xx&oh=00_AfBPLn2UD_6j-IjiADrS7alWBIsCADe2EHODDYTqOOEEfg&oe=64F71DD3"),
                    fit: BoxFit.fill)),
          ),
          ListTile(
            title: Text("Home"),
            onTap: () {},
          ),
          ListTile(
            title: Text("My List"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Login"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
