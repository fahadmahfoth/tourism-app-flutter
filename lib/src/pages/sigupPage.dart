import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tourism/src/pages/homePage.dart';
import 'package:tourism/src/repo/auth_repo.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  AuthRepo database = AuthRepo();
  bool isLooging = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: new Stack(
          children: <Widget>[
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
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 180,
                  ),
                  child: new Container(
                    padding: EdgeInsets.only(right: 0, left: 0),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(left: 180, top: 20),
                          child: new Text(
                            "انشاء الحساب",
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: new TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 10, left: 10, bottom: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                               ),
                            child: TextFormField(
                              controller: _usernameController,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              decoration: new InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 12, bottom: 12),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                  child: Icon(
                                    Icons.perm_identity,
                                    size: 25,
                                  ),
                                ),
                                hintText: 'الاسم',
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
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
                                    print(_usernameController.text);
                                    print(_passwordController.text);
                                    database
                                        .rigester(
                                            _usernameController.text,
                                            _emailController.text,
                                            _passwordController.text)
                                        .whenComplete(() {
                                      print(database.status);
                                      if (database.status) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                actions: <Widget>[
                                                  OutlineButton(
                                                    highlightedBorderColor:
                                                        Colors.green,
                                                    borderSide: BorderSide(
                                                        color: Colors.green,
                                                        width: 2),
                                                    color: Colors.red,
                                                    onPressed: () {
                                                      database.login(
                                                          _emailController.text,
                                                          _passwordController
                                                              .text);
                                                      Navigator.pushReplacement(
                                                          context,
                                                          CupertinoPageRoute(
                                                              builder:
                                                                  (context) {
                                                        return HomePage();
                                                      }));
                                                    },
                                                    child: Text(
                                                      "الرئيسية",
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    ),
                                                  ),
                                                ],
                                                title: Text(
                                                  "!رائع",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                content:
                                                    Text("تم انشاء الحساب"),
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
                                                    "تاكد من اتصالك بالانترنت ,وكتابة المعلومات بشكل صحيح , يجب كتابة كلمة سر قوية"),
                                              );
                                            });
                                      }
                                    });
                                  },
                                  child: new Text(
                                    "تسجيل ",
                                    style: new TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              )
                            : SpinKitChasingDots(
                                color: Theme.of(context).primaryColor,
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
