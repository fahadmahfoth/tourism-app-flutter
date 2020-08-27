import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/src/pages/aboutPage.dart';
import 'package:tourism/src/pages/homePage.dart';
import 'package:tourism/src/pages/loginPage.dart';
import 'package:tourism/src/pages/old_seen.dart';
import 'package:tourism/src/pages/suggestSendPage.dart';
import 'package:tourism/src/repo/user_auth_get.dart';
import 'package:tourism/src/utls/theme.dart';

class MYdrwer extends StatefulWidget {
  @override
  _MYdrwerState createState() => _MYdrwerState();
}

class _MYdrwerState extends State<MYdrwer> {
  var isLoged = false;

  UserRepo user = UserRepo();

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

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
    return Drawer(
      child: new Container(
        padding: EdgeInsets.only(top: 40),
        child: new ListView(
          children: <Widget>[
            isLoged
                ? FutureBuilder(
                    future: user.user(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return UserAccountsDrawerHeader(
                            currentAccountPicture: FlutterLogo(),
                            decoration: BoxDecoration(
                              color: Theme.of(context).canvasColor,
                            ),
                            arrowColor: Colors.white,
                            accountName: Text(
                              snapshot.data['name'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  backgroundColor:
                                      Theme.of(context).primaryColor),
                            ),
                            accountEmail: Text(
                              snapshot.data['email'],
                              style: TextStyle(
                                  backgroundColor:
                                      Theme.of(context).primaryColor),
                            ));
                      } else {
                        return UserAccountsDrawerHeader(
                            currentAccountPicture: FlutterLogo(),
                            decoration: BoxDecoration(
                              color: Theme.of(context).canvasColor,
                            ),
                            arrowColor: Colors.white,
                            accountName: Text(
                              "name",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF092061),
                              ),
                            ),
                            accountEmail: Text(
                              "email",
                              style: TextStyle(color: Color(0xFF092061)),
                            ));
                      }
                    },
                  )
                : SizedBox(),

//
            isLoged
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 50, left: 50),
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
                  )
                : SizedBox(
                    height: 0,
                  ),

            !isLoged
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 50, left: 50),
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
                            CupertinoPageRoute(
                              builder: (context) {
                                return Login();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : SizedBox(
                    height: 0,
                  ),
            isLoged
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 50, left: 50),
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
                          "السجل",
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
                                return SeenPage();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : SizedBox(
                    height: 0,
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
                      CupertinoPageRoute(
                        builder: (context) {
                          return About();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),

            isLoged
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 50, left: 50),
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
                            CupertinoPageRoute(
                              builder: (context) {
                                return ProblemPag();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : SizedBox(
                    height: 0,
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
                child: Consumer<ThemeNotifier>(
                  builder: (context, notifier, child) => SwitchListTile(
                    title: Text("الوظع المظلم",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onChanged: (val) {
                      notifier.toggleTheme();
                    },
                    value: !notifier.darkTheme,
                  ),
                ),
              ),
            ),

            isLoged
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 50, left: 50),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: new InkWell(
                        child: Center(
                            child: new Text(
                          "خروج",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) {
                                _save(null);
                                return HomePage();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : SizedBox(
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }
}
