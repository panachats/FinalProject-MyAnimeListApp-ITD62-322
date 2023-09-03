// ignore_for_file: prefer_const_constructors
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_application/Modules/configure.dart';

import 'package:flutter_application/Modules/usersAPI.dart';

class mylist extends StatefulWidget {
  const mylist({super.key});

  @override
  State<mylist> createState() => _mylistState();
}

class _mylistState extends State<mylist> {

  List<UsersApi> usersAPI = [];

  @override
  void initState() {
    // TODO: implement initState
    getlist();
    super.initState();
  }

  Future<void> getlist() async {
    var url = Uri.http(Configure.server, 'users');
    var response = await http.get(url);
    // print(response.body);
    setState(() {
      usersAPI = usersApiFromJson(response.body);
      print(usersAPI[0]);    //@remind แก้หลังทำ Login เสร็จ
    });
  }

  var test = [1, 2, 3, 4, 5, 6, 7];
  var img = [
    'https://cdn.myanimelist.net/images/anime/1188/136926.jpg',
    'https://cdn.myanimelist.net/images/anime/1007/136277.jpg',
    'https://cdn.myanimelist.net/images/anime/1569/134760.jpg',
    'https://cdn.myanimelist.net/images/anime/1582/136325.jpg',
    'https://cdn.myanimelist.net/images/anime/1696/136634.jpg',
    'https://cdn.myanimelist.net/images/anime/1164/138058.jpg',
    'https://cdn.myanimelist.net/images/anime/1571/134525.jpg',
    'https://cdn.myanimelist.net/images/anime/1396/136273.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Color(0xFF2b2d42),
      ),
      // drawer: SideMenu(),
      // body: showAll(),
      body: ListView.builder(
        itemCount: test.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 200,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Row(children: [
                Container(

                      child: SizedBox(
                        width: 148.4,
                        // child: Image.network(
                        //     'https://cdn.myanimelist.net/images/anime/1898/138005.jpg'),
                        // child: Image.network(img[index],scale: 2,),
                        child: Image.network(usersAPI[0].anime ?? ,scale: 2,),
                      ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 212.6,
                          // height: 212.6,
                          child: ListTile(
                            // shape: RoundedRectangleBorder(side: BorderSide(width: 2)),
                            title: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: Text(
                                  'The Rising of the Shield Hero Season 3'),
                            ),
                            // subtitle: Text('${MediaQuery.of(context).size.height}'),
                            subtitle: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text('Watching: Ep.15 of 50'),
                            ),
                            // trailing: Text('${test[index]}'),
                          ),
                        ),
                        
                        ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(3),
                                    child: Icon(Icons.edit)),
                                Container(
                                    margin: EdgeInsets.all(3),
                                    child: Text('Edit Episode')),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                
              ]),
            ),
          );
        },
      ),
    );
  }
}
