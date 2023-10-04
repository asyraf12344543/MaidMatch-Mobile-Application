import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maidapps2/database/models/book.dart';
import 'package:maidapps2/database/page/addpage.dart';
import 'package:maidapps2/database/page/editpage.dart';
import 'package:flutter/material.dart';
import 'package:maidapps2/screens/home/homepage.dart';

import '../services/firebase_crud.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPage();
  }
}

class _ListPage extends State<ListPage> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readBook();
  //FirebaseFirestore.instance.collection('Employee').snapshots();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("List of Order"),
          backgroundColor: Colors.pink,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.app_registration,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => AddPage(),
                  ),
                      (route) =>
                  false, //if you want to disable back feature set to false
                );
              },
            ),
            IconButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Homepage()),

                          (route) => false);
                },
                icon: Icon(
                  Icons.home,
                ),
            )
          ],
        ),
        body: StreamBuilder(
          stream: collectionReference,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView(
                  children: snapshot.data!.docs.map((e) {
                    return Card(
                        child: Column(children: [
                          ListTile(
                            title: Text(e["date"], style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Container(
                              child: (Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Time: " + e['time'],
                                      style: const TextStyle
                                        (fontSize: 14, fontWeight: FontWeight.bold)),
                                  Text("Address: " + e['address'],
                                      style: const TextStyle(fontSize: 12)),
                                  Text("Special Request: " + e['specialrequest'],
                                      style: const TextStyle(fontSize: 12)),
                                ],
                              )),
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(5.0),
                                  primary: const Color.fromARGB(255, 143, 133, 226),
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                child: const Text('Edit'),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) => EditPage(
                                        book: Book(
                                            uid: e.id,
                                            date: e["date"],
                                            time: e["time"],
                                            address: e["address"],
                                        specialrequest: e["specialrequest"]),
                                      ),
                                    ),
                                        (route) =>
                                    false, //if you want to disable back feature set to false
                                  );
                                },
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(5.0),
                                  primary: const Color.fromARGB(255, 143, 133, 226),
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                child: const Text('Delete'),
                                onPressed: () async {
                                  var response =
                                  await FirebaseCrud.deleteBook(docId: e.id);
                                  if (response.code != 200) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content:
                                            Text(response.message.toString()),
                                          );
                                        });
                                  }
                                },
                              ),
                            ],
                          ),
                        ]));
                  }).toList(),
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}