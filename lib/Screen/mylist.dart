
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:flutter_application/Modules/configure.dart';
import 'package:flutter_application/Modules/animeAPI.dart';


class Mylist extends StatefulWidget {
  static const routeName = "/mylist";
  const Mylist({super.key});

  @override
  State<Mylist> createState() => _MylistState();
}

class _MylistState extends State<Mylist> {
  List<MyListData> mylist = [];

  @override
  void initState() {
    // TODO: implement initState
    getMyList();
    super.initState();
  }

  Future<void> getMyList() async {
    var url = Uri.http(Configure.server, 'myList');
    var resp = await http.get(url);

    setState(() {
      mylist = myListDataFromJson(resp.body);
    });
    return;
  }




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
        itemCount: mylist.length,
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
                        // child: Image.network(img[index],scale: 2,),
                        child: Image.network(mylist[index].img ?? '', scale: 2,)
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
                                  '${mylist[index].title}'),
                            ),
                            // subtitle: Text('${MediaQuery.of(context).size.height}'),
                            subtitle: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text('Watching: ${mylist[index].progress} of ${mylist[index].ep}'),
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
