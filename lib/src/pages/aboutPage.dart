import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutState();
  }
}

class AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("حول التطبيق"),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
            padding: EdgeInsets.only(top: 15, right: 5, left: 5),
            child: new ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: new Card(
                    child: new Column(
                      children: <Widget>[
                        const ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                            child: Text(
                              'تطبيق دليل السياحي',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          subtitle: Text(
                            'هو تطبيق يسهل على الزائر البحث عن المناطق السياحية ،الترفيهية ،مراكز التسوق ،المطاعم والفنادق داخل محافظة نينوى  ',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Text("Manager",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Expanded(
                        child: new Divider(
                          indent: (10),
                        ),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 25,
                  ),
                ),
                const ListTile(
                  contentPadding:
                      EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                  title: Text(
                    "Taha Ammar",
                    style: TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                  subtitle: Text('Project Manager & Designer-UI/UX'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assats/imags/taha.png'),
                    radius: 30,
                  ),
                ),
                const ListTile(
                  contentPadding:
                      EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                  title: Text(
                    "Muhammed Essa",
                    style: TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                  subtitle: Text('General Supervision : Code for Iraq'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assats/imags/mohammed.png'),
                    radius: 30,
                  ),
                ),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Text("Developer",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Expanded(
                        child: new Divider(
                          indent: (10),
                        ),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 25,
                  ),
                ),
                const ListTile(
                  contentPadding:
                      EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                  title: Text(
                    "Fahad Mahfoth",
                    style: TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                  subtitle: Text('(Web&Mobile-Developer'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assats/imags/fahad.jpg'),
                    radius: 30,
                  ),
                ),
                const ListTile(
                  contentPadding:
                      EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                  title: Text(
                    "Shahla Ali",
                    style: TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                  subtitle: Text('Mobile-Developer'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assats/imags/shhla.png'),
                    radius: 30,
                  ),
                ),
                const ListTile(
                  contentPadding:
                      EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                  title: Text(
                    "Abdulrahman Thanoon ",
                    style: TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                  subtitle: Text('Web-Developer'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assats/imags/abd.png'),
                    radius: 30,
                  ),
                ),
                const ListTile(
                  contentPadding:
                      EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                  title: Text(
                    "Marwa Ammar",
                    style: TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                  subtitle: Text('Mobile-Developer'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assats/imags/marwa1.png'),
                    radius: 30,
                  ),
                ),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Text("Information-Gathering",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Expanded(
                        child: new Divider(
                          indent: (10),
                        ),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 25,
                  ),
                ),
                const ListTile(
                  contentPadding:
                      EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                  title: Text(
                    "Yousif Khalid",
                    style: TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assats/imags/yosif.png'),
                    radius: 30,
                  ),
                ),
                const ListTile(
                  contentPadding:
                      EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                  title: Text(
                    "Mays Ibrahim",
                    style: TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assats/imags/mays.png'),
                    radius: 30,
                  ),
                ),
                const ListTile(
                  contentPadding:
                      EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                  title: Text(
                    "Noor Ibrahim",
                    style: TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assats/imags/noor.png'),
                    radius: 30,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
