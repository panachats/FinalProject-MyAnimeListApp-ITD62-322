
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:validation_pro/validation_pro.dart';

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
  final _editformkey = GlobalKey<FormState>();

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

    Future<void> upDateMyList(id) async {
    var url = Uri.http(Configure.server, 'myList/$id');
    var resp = await http.put(url,
    headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
    },
        );

    setState(() {
      mylist = myListDataFromJson(resp.body);
    });
    return;
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF0B1622),
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Card(
                color: Color(0xFF151f2e),
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
                                    '${mylist[index].title}',style: TextStyle(color: Colors.white),),
                              ),
                              // subtitle: Text('${MediaQuery.of(context).size.height}'),
                              subtitle: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text('Type: Anime\n\n${mylist[index].type == 'anime' ? 'Watching' : 'Reading'}: ${mylist[index].progress} of ${mylist[index].ep}', style: TextStyle(color: Color(0XFF8a919c),),), //Check type for anime and manga
                              ),
                              // trailing: Text('${test[index]}'),
                            ),
                          ),
                          
                          ElevatedButton(
                              onPressed: () {
                                final editList = TextEditingController(text: "${mylist[index].progress}");
                                int intProgress = int.parse(mylist[index].ep);

                                showDialog(context: context, builder: (context) {
                                  return AlertDialog(
                                    title: Text('Edit Progress'),
                                    content: SizedBox(
                                      width: 100,
                                      child: Form(
                                        key: _editformkey,
                                        child: TextFormField(
                                          controller: editList,
                                          validator: (value) {
                                            
                                            if(value == ''){
                                              return "This field is required";
                                            }else if (value!.contains('.') || value!.contains(',')){
                                              return "Input decimal number only";
                                            }

                                            // Transform value into int

                                            int intValue = int.parse(value);

                                            if(intValue > intProgress){
                                              return "Your input is exceed total ${mylist[index].type == 'anime' ? 'Episodes':'Chapters'}";
                                            }
                                            
                                            return null;
                                          },
                                          autofocus: true,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(hintText: "Input number of ${mylist[index].type == 'anime' ? 'episodes':'chapters'}"),
                                          
                                        ),
                                      ),
                                    ),

                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          if(_editformkey.currentState!.validate()){
                                            print('object');
                                          }
                                        }, child: Text('Test')
                                        )
                                    ],
                                  );
                                },);
                              },
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
            ),
          );
        },
      ),
    );
  }
}
