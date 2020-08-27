import 'package:flutter/cupertino.dart';

/// lib/Componts/Location.dart
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/src/pages/placeDetail.dart';
import 'package:tourism/src/utls/sqllite_database_old.dart';

import 'loginPage.dart';

class SeenPage extends StatefulWidget {
  @override
  _SeenState createState() => _SeenState();
}

class _SeenState extends State<SeenPage> {
  DatabaseHelperOld db = new DatabaseHelperOld();

  var isLoged = false;

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? "0";
    if (value != "0") {
      setState(() {
        isLoged = true;
      });

      return value;
    }
  }

  @override
  void initState() {
    super.initState();
    read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('السجل'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.red,
                ),
                onPressed: () {
                  db.deleteAllSeen();
                  setState(() {
                    db.getAllSeen();
                  });
                })
          ],
        ),
        body: Container(
          child: isLoged
              ? FutureBuilder(
                  future: db.getAllSeen(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data.length != 0
                          ? ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            fullscreenDialog: true,
                                            builder: (context) {
                                              return PlaceDetails(
                                                  snapshot.data[index]);
                                            }));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Container(
                                      height: 70,
                                      child: Card(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: Text(
                                                snapshot.data[index]['name'],
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: FaIcon(FontAwesomeIcons
                                                    .arrowCircleLeft)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Text('no seen now'),
                            );
                    } else {
                      return Center(
                        child: SpinKitChasingDots(
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }
                  },
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 20, right: 50, left: 50),
                  child: Center(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF1D326D),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: new InkWell(
                        child: Center(
                            child: new Text(
                          "تسجيل",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) {
                                return Login();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
        ));
  }
}
