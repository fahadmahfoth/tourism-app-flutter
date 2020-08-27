/// lib/Componts/Location.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/src/pages/placeDetail.dart';
import 'package:tourism/src/repo/place_repo.dart';
import 'package:tourism/src/utls/sqllite_database.dart';
import 'package:tourism/src/widgets/insidePlaceWidget.dart';

import 'loginPage.dart';

class FavPage extends StatefulWidget {
  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  DatabaseHelper db = new DatabaseHelper();

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
    // db.saveFavorite(Favorite(name: 'fahad', categoryId:));
    return Container(
      child: isLoged
          ? FutureBuilder(
              future: db.getAllFavorite(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data.length != 0
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            print(snapshot.data[index]['image']);
                            return GestureDetector(
                              onTap: (){
                                 Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            fullscreenDialog: true,
                                            builder: (context) {
                                              return PlaceDetails(
                                                  snapshot.data[index]);
                                            }));
                              },
                                                          child: InsidePlaceWidget(
                                title: snapshot.data[index]['name'],
                                img: snapshot.data[index]['image'],
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text('لاتوجد مواقع مفضلة لديك'),
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
    );
  }
}
