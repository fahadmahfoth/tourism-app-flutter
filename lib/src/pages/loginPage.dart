import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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

  void _submit() {
    setState(() {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xffF5F5F5),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 25),
      ),
      backgroundColor: Color(0xffF5F5F5),
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
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
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
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, right: 10, left: 10, bottom: 8),
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
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, right: 10, left: 10, bottom: 15),
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
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        height: 50, width: 200,
//
                        child: new RaisedButton(
                          color: Color(0xFF1D326D),
//
                          onPressed: _submit,
                          child: new Text(
                            "تسجيل الدخول",
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
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
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
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
                                    PageTransition(
                                      duration: Duration(milliseconds: 170),
                                      type: PageTransitionType.rightToLeft,
                                      child: SignUp(),
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
