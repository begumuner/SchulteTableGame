import 'package:flutter/material.dart';
import 'oyunsayfasi.dart';
import 'puanListesi.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.green[300],
          child: Padding(
              padding: EdgeInsets.all(60),
              child: Form(
                child: ListView(
                  children: [
                    Container(
                      width: 20,
                      height: 180,
                      child: Center(
                        child: Text(
                          "Schulte Table Game",
                          style: TextStyle(fontSize: 25.0, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GamePage()));
                          },
                          child: Text(
                            "Start",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.black,
                          splashColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.white),
                          )),
                    ),
                    Divider(color: Colors.green[300],),
                    Container(
                      height: 30,
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => puan()));
                          },
                          child: Text(
                            "SCORE TABLE",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.black,
                          splashColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
