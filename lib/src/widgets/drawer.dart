import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tourism/src/pages/aboutPage.dart';
import 'package:tourism/src/pages/loginPage.dart';
import 'package:tourism/src/pages/suggestSendPage.dart';

class MYdrwer extends StatefulWidget {
  @override
  _MYdrwerState createState() => _MYdrwerState();
}

class _MYdrwerState extends State<MYdrwer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new Container(
        padding: EdgeInsets.only(top: 40, right: 5),
        child: new ListView(
          children: <Widget>[
//
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 50, left: 50),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF1D326D),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: new InkWell(
                    child: Center(
                        child: new Text(
                      "قيم التطبيق",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
                    onTap: () {}),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 50, left: 50),
              child: Container(
                width: 50,
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
                  PageTransition(
                    duration: Duration(milliseconds: 170),
                    type: PageTransitionType.rightToLeft,
                    child: Login(),
                  ),
                );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 50, left: 50),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF1D326D),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: new InkWell(
                  child: Center(
                      child: new Text(
                    "حول التطبيق",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )),
                  onTap: () {
                    Navigator.push(
                  context,
                  PageTransition(
                    duration: Duration(milliseconds: 170),
                    type: PageTransitionType.rightToLeft,
                    child: About(),
                  ),
                );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20, right: 50, left: 50),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF1D326D),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: new InkWell(
                  child: Center(
                      child: new Text(
                    "ابلاغ عن مشكلة",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )),
                  onTap: () {
                    Navigator.push(
                  context,
                  PageTransition(
                    duration: Duration(milliseconds: 170),
                    type: PageTransitionType.rightToLeft,
                    child: ProblemPag(),
                  ),
                );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
