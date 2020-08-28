import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tourism/src/repo/suggetion_repo.dart';
import 'homePage.dart';

class ProblemPag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProblemPagState();
  }
}

class ProblemPagState extends State<ProblemPag> {
  SuggRepo database = SuggRepo();
  bool isLooging = false;

  TextEditingController _problemController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text(
            "ابلاغ  عن مشكلة",
          ),
          actions: [
            !isLooging
                ? IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      setState(() {
                        isLooging = true;
                      });
                      print(_usernameController.text);
                      print(_emailController.text);
                      print(_problemController.text);
                      database
                          .addSugg("Fahad", "sadasdasd@dfasdas.conf",
                              "sdasdasdgdorgjsdof")
                          .whenComplete(() {
                        print(database.status);
                        if (database.status) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: <Widget>[
                                    OutlineButton(
                                      highlightedBorderColor: Colors.green,
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 2),
                                      color: Colors.red,
                                      onPressed: () {
                                        Navigator.pushReplacement(context,
                                            CupertinoPageRoute(
                                                builder: (context) {
                                          return HomePage();
                                        }));
                                      },
                                      child: Text(
                                        "الرئيسية",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ],
                                  title: Text(
                                    "!رائع",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  content: Text("تم"),
                                );
                              });
                        }
                        if (!database.status) {
                          setState(() {
                            isLooging = false;
                          });

                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: <Widget>[
                                    OutlineButton(
                                      highlightedBorderColor: Colors.red,
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2),
                                      color: Colors.red,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "اغلاق",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  ],
                                  title: Text(
                                    "خطأ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  content: Text(
                                      "تاكد من اتصالك بالانترنت"),
                                );
                              });
                        }
                      });
                    },
                  )
                : SpinKitChasingDots(
                    color: Colors.white,
                  ),
          ],
        ),
        backgroundColor: Color(0xffF5F5F5),
        body: ListView(physics: BouncingScrollPhysics(), children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            height: 174,
            width: MediaQuery.of(context).size.width,
//
            child: new Image.asset(
              "assats/imags/feedback.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 15),
            child: TextFormField(
              controller: _usernameController,
              textAlign: TextAlign.right,
              keyboardType: TextInputType.text,
              obscureText: false,
              style: TextStyle(
                color: Colors.black
              ),
              decoration: new InputDecoration(
                
                
                contentPadding: EdgeInsets.only(top: 12, bottom: 12),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(
                    Icons.perm_identity,
                    size: 25,
                  ),
                ),
                hintText: 'الاسم',
                hintStyle: TextStyle(
                  color: Colors.black
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 15),
            child: TextFormField(
              controller: _emailController,
              textAlign: TextAlign.right,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              style: TextStyle(
                color: Colors.black
              ),
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.only(top: 12, bottom: 12),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(
                    Icons.email,
                    size: 25,
                  ),
                ),
                hintText: 'البريد الالكتروني',
                filled: true,
                fillColor: Colors.white,
                 hintStyle: TextStyle(
                  color: Colors.black
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 15),
            child: TextFormField(
              maxLines: 7,
              controller: _problemController,
              keyboardType: TextInputType.multiline,
              textAlign: TextAlign.right,
              obscureText: false,
              style: TextStyle(
                color: Colors.black
              ),

              decoration: new InputDecoration(
                contentPadding: EdgeInsets.only(top: 12, bottom: 12, right: 12),
                alignLabelWithHint: true,
                hintText: ' اكتب المشكلة هنا',
                 hintStyle: TextStyle(
                  color: Colors.black
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ]));
  }
}
