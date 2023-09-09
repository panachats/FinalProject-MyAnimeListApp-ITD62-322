import 'package:flutter/material.dart';
import 'package:flutter_application/modules/configure.dart';
import 'package:flutter_application/screen/login.dart';
import 'package:flutter_application/screen/mylist.dart';
// import 'package:flutter_application/screen/home.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    String accountName = "${Configure.login.username}";
    String accountEmail = "${Configure.login.email}";
    String accountUrl =
        '${Configure.uid == '001' ? 'https://scontent.fbkk25-1.fna.fbcdn.net/v/t39.30808-6/371980227_3543077902590424_4719688806673984362_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a2f6c7&_nc_eui2=AeFkUdSklSulCZnpOFJI2BH6HvkCJJ78hNEe-QIknvyE0YcobQvHT5iylPfVMp8GjeEd7f17o6aO9LOgV8qICe9O&_nc_ohc=jyuiayf-2x8AX8bccSH&_nc_ht=scontent.fbkk25-1.fna&oh=00_AfBmdgpTVQXVNz7eQEEsnh9XNjumYWJQHvTQQ1XBvneoQw&oe=64FDA4E2' : 'https://cdn-icons-png.flaticon.com/512/599/599305.png'}'
        "";
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
                        '${Configure.uid == '001' ? 'https://scontent-sin6-4.xx.fbcdn.net/v/t1.6435-9/81898784_854582521623627_1854656445660790784_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeHm_ReCCSkdoZlV5kjHlWNxtwGDnbIDu1G3AYOdsgO7UcL1jOLAoKgo3t0oOcH_m2sGpdXWUmUA1puO5eu464Bs&_nc_ohc=U7ISPirLH6MAX_aEXiT&_nc_ht=scontent-sin6-4.xx&oh=00_AfDKiJERkSZ25sljWuDGAUjY4yJHUZaE6ZIAiSVAzYyPng&oe=65211EA2' : 'https://cdn.wallpapersafari.com/95/51/NUSzcR.jpg'}'
                        ""),
                    fit: BoxFit.fill)),
          ),
          ListTile(
            title: Text("My List"),
            onTap: () {
              Navigator.pushNamed(context, Mylist.routeName);
            },
          ),
          ListTile(
            title: Text("Log out"),
            onTap: () {
              Configure.uid = '';
              Navigator.pushNamed(context, Login.routeName);
            },
          ),
        ],
      ),
    );
  }
}
