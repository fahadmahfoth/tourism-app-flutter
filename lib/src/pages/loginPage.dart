import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tourism/src/repo/auth_repo.dart';

import 'homePage.dart';
import 'sigupPage.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool isLooging = false;
  AuthRepo database = AuthRepo();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(),
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: new Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 30,
            ),
            child: Container(
              height: 250,
              width: 300,
//
              child: new Image.asset(
                "assats/imags/3.png",
                width: 200,
                height: 200,
              ),
            ),
          ),
          ListView(
            physics: BouncingScrollPhysics(),
//                     padding: EdgeInsets.all(10.0,),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 200,
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 0),
                  child: new Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 250),
                        child: new Text(
                          "أهلاَ بك",
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: new TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: new Container(
                          height: 30,
                          margin: EdgeInsets.only(left: 130),
                          child: new Text(
                            "قم بتسجيل الدخول للمتابعة",
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: new TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, right: 10, left: 10, bottom: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.emailAddress,
                            decoration: new InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 12, bottom: 12),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                  child: Icon(
                                    Icons.email,
                                    size: 25,
                                  ),
                                ),
                                hintText: 'البريد الالكتروني',
                                alignLabelWithHint: true,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, right: 10, left: 10, bottom: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                             ),
                          child: TextFormField(
                            controller: _passwordController,
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 12, bottom: 12),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Icon(
                                  Icons.lock,
                                  size: 25,
                                ),
                              ),
                              hintText: 'كلمة السر',
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      !isLooging
                          ? new Container(
                              height: 50, width: 200,
//
                              child: new RaisedButton(
                                color: Color(0xFF1D326D),
//
                                onPressed: () {
                                  setState(() {
                                    isLooging = true;
                                  });
                                  print(_emailController.text);
                                  print(_passwordController.text);
                                  database
                                      .login(_emailController.text,
                                          _passwordController.text)
                                      .whenComplete(() {
                                    print(database.status);
                                    if (database.status) {
                                      print(database.status.toString());
                                      Navigator.pushReplacement(context,
                                          CupertinoPageRoute(
                                              builder: (context) {
                                        return HomePage();
                                      }));
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
                                                  highlightedBorderColor:
                                                      Colors.red,
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 2),
                                                  color: Colors.red,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "اغلاق",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                )
                                              ],
                                              title: Text(
                                                "خطأ",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              content: Text(
                                                  "تاكد من ادخال بيانات بشكل صحيح"),
                                            );
                                          });
                                    }
                                  });
                                },
                                child: new Text(
                                  "تسجيل الدخول",
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            )
                          : SpinKitChasingDots(
                              color: Theme.of(context).primaryColor,
                            ),
                      Center(
                        child: new Container(
//                        padding: EdgeInsets.only(right: 90,top: 10,),
                          alignment: Alignment.center,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                                "ليس لديك حساب؟ ",
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.ltr,
                                style: new TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              FlatButton(
                                child: new Text(
                                  ' سجل الان  ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) {
                                        return SignUp();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
