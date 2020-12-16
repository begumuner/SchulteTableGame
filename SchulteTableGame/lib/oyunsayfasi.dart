import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:mpodevdeneme6/model2.dart';

import 'anasayfa.dart';
import 'databasehelper.dart';
import 'databasehelper2.dart';
import 'model.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Puanlar> tumPuanlar;
  List<High> tumHigh;
  DatabaseHelper _dbHelper;
  DatabaseHelper2 _dbHelper2;
  List<int> inttumPuanlar2 = [];
  List<String> stringtumPuanlar2;

  List<GlobalKey<FlipCardState>> cardStateKey = [];
  List<String> data = [];
  int a = 0;
  int time2 = 0;
  int time = 0;
  Timer timer;
  Timer timer2;

  @override
  void initState() {
    tumPuanlar = List<Puanlar>();
    tumHigh = List<High>();

    _dbHelper = DatabaseHelper();
    _dbHelper2 = DatabaseHelper2();

    super.initState();
    for (var i = 0; i < 24; i++) {
      cardStateKey.add(GlobalKey<FlipCardState>());
    }

    for (var i = 1; i < 25; i++) {
      data.add(i.toString());
    }

    data.shuffle();
    //sayac icin
    startTimer();
    start();

  }

//milisaniye
  start() {
    timer2 = Timer.periodic(Duration(milliseconds: 1), (a) {
      setState(() {
        time2 = time2 + 1;
        if (time2 == 60) {
          time2 = 0;
        }
      });
    });
  }

//saniye
  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        time = time + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text(
          //sure sayacini yukari yazdirdik
          "Time : $time . $time2",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 11,
            crossAxisSpacing: 11,
            children: List.generate(
              24,
              (index) {
                return GestureDetector(
                  onTap: () {},
                  child: FlipCard(
                    key: cardStateKey[index],
                    flipOnTouch: false,
                    front: RaisedButton(
                      color: Colors.green[300],
                      onPressed: () async {
                        if (data[index] == "1") {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "2" && a == 1) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "3" && a == 2) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "4" && a == 3) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "5" && a == 4) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "6" && a == 5) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "7" && a == 6) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "8" && a == 7) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "9" && a == 8) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "10" && a == 9) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "11" && a == 10) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "12" && a == 11) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "13" && a == 12) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "14" && a == 13) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "15" && a == 14) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "16" && a == 15) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "17" && a == 16) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "18" && a == 17) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "19" && a == 18) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "20" && a == 19) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "21" && a == 20) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "22" && a == 21) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "23" && a == 22) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (data[index] == "24" && a == 23) {
                          cardStateKey[index].currentState.toggleCard();
                          a++;
                        }
                        if (a == 24) {
                          _dbHelper.insertPuanlar(Puanlar(puan: "$time.$time2"));
                          debugPrint("db calisti");

                          showResult();
                        }
                      },
                      child: Container(
                        color: Colors.green[300],
                        child: Center(
                          child: Text('${data[index]}',
                              style: Theme.of(context).textTheme.display1),
                        ),
                      ),
                    ),
                    back: Container(
                      child: Center(
                          child: Text('X',
                              style: Theme.of(context).textTheme.display1)),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  //sonuc
  showResult() async {
    timer.cancel();
    timer2.cancel();



     _dbHelper2.highPuanlar(High(high: time));
    //debugPrint("db calisti");
    var mapListe = await _dbHelper2.getHigh();
    

  for (Map okunanpuanMapi in mapListe) {
      inttumPuanlar2.add(int.parse(okunanpuanMapi["high"]));
    }

    

    var enyuksek = enIyisi(stringtumPuanlar2);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text(
                "High Score : " + enyuksek.toString(),
                style: TextStyle(color: Colors.green),
              ),
              content: Text(
                "Time $time . $time2",
                style: Theme.of(context).textTheme.display2,
              ),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ));
  }

  int enIyisi(List<String> stringListe) {
    
    bubbleSort(inttumPuanlar2);
    return inttumPuanlar2[0];
  }

  void bubbleSort(List list) {
    if (list == null || list.length == 0) return;

    int n = list.length;
    int i, step;
    for (step = 0; step < n; step++) {
      for (i = 0; i < n - step - 1; i++) {
        if (list[i] > list[i + 1]) {
          swap(list, i);
        }
      }
    }
  }

  void swap(List list, int i) {
    int temp = list[i];
    list[i] = list[i + 1];
    list[i + 1] = temp;
  }
}
