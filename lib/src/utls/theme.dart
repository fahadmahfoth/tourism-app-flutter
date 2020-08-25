import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF092061),
    accentColor: Color(0xFF092061),
    fontFamily: "Amiri",
    scaffoldBackgroundColor: Color(0xfff1f1f1),
    primaryTextTheme: TextTheme(

      bodyText1: TextStyle(
        fontSize: 20
      ),

    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 20
      )
    )
    );
    

ThemeData dark = ThemeData(
      primaryTextTheme: TextTheme(

      bodyText1: TextStyle(
        fontSize: 20
      ),

    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 20
      )
    ),    
    brightness: Brightness.dark,
    
    primarySwatch: Colors.indigo,
    fontFamily: "Amiri",
    accentColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: Colors.black));

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}
