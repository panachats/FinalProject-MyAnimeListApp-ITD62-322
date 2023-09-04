import 'package:flutter/material.dart';
import 'package:flutter_application/Screen/home.dart';

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
            onTap: () {
              Navigator.pushNamed(context, Home.routeName);
            },
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
