import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  var test = [1, 2, 3, 4, 5, 6, 7];

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
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Row(children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                      width: 148.4,
                      child: Image.network(
                          'https://cdn.myanimelist.net/images/anime/1898/138005.jpg')),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: SizedBox(
                    width: 212.6,
                    height: 212.6,
                    child: ListTile(
                      // shape: RoundedRectangleBorder(side: BorderSide(width: 2)),
                      title: Text(
                          'Mushoku Tensei: Jobless Reincarnation Season 2'),
                      subtitle: Text('${MediaQuery.of(context).size.height}'),
                      trailing: Text('${test[index]}'),
                    ),
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
