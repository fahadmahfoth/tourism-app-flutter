import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/src/models/favorite_model.dart';
import 'package:tourism/src/models/seen_model.dart';
import 'package:tourism/src/pages/place_map.dart';
import 'package:tourism/src/utls/sqllite_database.dart';
import 'package:tourism/src/utls/sqllite_database_old.dart';

class PlaceDetails extends StatefulWidget {
  final place_d;

  PlaceDetails(this.place_d);
  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  double heigth = 310;
  DatabaseHelper db = new DatabaseHelper();

  DatabaseHelperOld dbOld = new DatabaseHelperOld();

  addToSeen() async {
    Future.delayed(const Duration(seconds: 2), () {
      dbOld.deleteFavorite(widget.place_d['id']);
      dbOld.saveSeen(Seen(
          id: widget.place_d['id'],
          name: widget.place_d['name'],
          categoryId: widget.place_d['category_id'],
          city: widget.place_d['city'],
          contente: widget.place_d['contente'],
          days: widget.place_d['days'],
          image: widget.place_d['image'],
          mapLng: widget.place_d['map_lng'],
          mapLat: widget.place_d['map_lat'],
          phoneNumber: widget.place_d['phone_number'],
          timeDown: widget.place_d['time_down'],
          timeUp: widget.place_d['time_up'],
          createdAt: DateTime.now()));
      print("added to seen objects");
    });
  }

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
    addToSeen();
    super.initState();

    read();
  }

  int mapheight = 400;
  bool isFav = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SafeArea(
          child: FutureBuilder(
        future: db.getFavorite(widget.place_d['id']),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Stack(
                      children: [
                        Container(
                            height: 310,
                            width: MediaQuery.of(context).size.width,
                            child: CachedNetworkImage(
                              imageUrl: widget.place_d['image'],
                              fit: BoxFit.cover,
                            )),
                        Positioned(
                          right: 20,
                          bottom: 20,
                          child: Text(
                            widget.place_d['name'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        isLoged == true
                            ? Positioned(
                                left: 20,
                                top: 20,
                                child: IconButton(
                                  onPressed: () {
                                    if (snapshot.data != 0 && isFav == true) {
                                      setState(() {
                                        isFav = false;
                                      });
                                      db.deleteFavorite(widget.place_d['id']);
                                      print('deleted from favorite !');
                                    } else {
                                      setState(() {
                                        isFav = true;
                                      });
                                      db.saveFavorite(Favorite(
                                          id: widget.place_d['id'],
                                          name: widget.place_d['name'],
                                          categoryId:
                                              widget.place_d['category_id'],
                                          city: widget.place_d['city'],
                                          contente: widget.place_d['contente'],
                                          days: widget.place_d['days'],
                                          image: widget.place_d['image'],
                                          mapLng: widget.place_d['map_lng'],
                                          mapLat: widget.place_d['map_lat'],
                                          phoneNumber:
                                              widget.place_d['phone_number'],
                                          timeDown: widget.place_d['time_down'],
                                          timeUp: widget.place_d['time_up']));
                                      print("Saved to favorite ! ");
                                    }
                                  },
                                  iconSize: 35,
                                  icon: snapshot.data != 0 && isFav == true
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                        ),
                                ))
                            : SizedBox(),
                        Positioned(
                            left: 20,
                            bottom: 10,
                            child: IconButton(
                              iconSize: 35,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) {
                                          return LocationPlacePage(
                                              widget.place_d['name']);
                                        }));
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.mapMarkedAlt,
                                color: Colors.green,
                              ),
                            )),
                        Positioned(
                            right: 20,
                            top: 20,
                            child: IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.black,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: ListTile(
                    title: Text('رقم الهاتف'),
                    subtitle: Text(widget.place_d['phone_number'].toString()),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text('الحي او المنطقة'),
                    subtitle: Text(widget.place_d['city'].toString()),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text('ايام العمل'),
                    subtitle: Text(widget.place_d['days'].toString()),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text('وقت الفتح'),
                    subtitle: Text(widget.place_d['time_up'].toString()),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: ListTile(
                    title: Text('وقت الاغلاق'),
                    subtitle: Text(widget.place_d['time_up'].toString()),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text('contente'),
                    subtitle: Text(widget.place_d['contente'].toString()),
                  ),
                ),
              ],
            );
          } else {
            return SpinKitChasingDots(
              color: Theme.of(context).primaryColor,
            );
          }
        },
      )),
    ));
  }
}
