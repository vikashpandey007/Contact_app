import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Contactlist extends StatefulWidget {
  @override
  _ContactlistState createState() => _ContactlistState();
}

class _ContactlistState extends State<Contactlist> {
  var data;
  String url = "http://userapi.tk/";

  Future<String> getjsondata() async {
    var responese = await http.get(Uri.encodeFull(url));
    setState(() {
      var convertdata = json.decode(responese.body);
      data = convertdata;
      print(data);
    });
  }

  @override
  void initState() {
    getjsondata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Phone',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, int index) {
              return Column(
                children: <Widget>[
                  Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.horizontal,
                    background: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 300),
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 300),
                        child: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      elevation: 0.3,
                      child: ListTile(
                      
                        // title: Text(data[index]["name"]),
                        leading: GestureDetector(
                          // onTap: () {
                          //   navigateToDetail(this.noteList[position], 'Edit to do');
                          // },
                        
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            backgroundImage:
                                NetworkImage(data[index]["ImageURL"]),
                          ),
                          
                        ),

                       
                      ),
                    ),
                  ),
                ],
              );
            })
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // Navigator.push(
        //     //     context, MaterialPageRoute(builder: (context) => TodoDetail()));
        //   },
        //   child: Icon(Icons.add),
        // ),
        );
  }
}
