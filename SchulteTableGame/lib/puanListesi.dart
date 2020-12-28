import 'package:flutter/material.dart';
import 'package:mpodevdeneme6/model2.dart';

import 'databasehelper.dart';
import 'databasehelper2.dart';
import 'model.dart';

class puan extends StatefulWidget {
  @override
  _puanState createState() => _puanState();
}

class _puanState extends State<puan> {
  int enyuksek;

  List<High> tumHigh;
  List<Puanlar> tumPuanlar;
  DatabaseHelper _dbHelper;
  DatabaseHelper2 _dbHelper2;

  List<int> InttumPuanlar2;
  List<String> StringtumPuanlar2;

  Future<void> initState() {
    super.initState();
    _dbHelper = DatabaseHelper();
    _dbHelper2 = DatabaseHelper2();
    tumPuanlar = List<Puanlar>();
    tumHigh = List<High>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(
          "SCORE",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: _dbHelper.getPuanList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            tumPuanlar = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      child: Card(
                        color: Colors.green[500],
                        margin: EdgeInsets.all(4),
                        elevation: 20,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.stars,
                              color: Colors.green[300],
                            ),
                            backgroundColor: Colors.white,
                          ),
                          title: Text(tumPuanlar[index].puan),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: tumPuanlar.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
