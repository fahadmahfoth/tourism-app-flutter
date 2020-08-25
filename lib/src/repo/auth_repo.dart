import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/src/utls/url.dart';

class AuthRepo {
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  var status;
  Future<List> login(String username, String password) async {
    String myUrl = "https://tourismnineveh.codeforiraq.org/api/auth/login";
    try {
      await http.post(myUrl, body: {
        "password": "$password",
        "email": "$username",
      }).then((response) {
        status = response.statusCode == HttpStatus.ok;
        print(response.statusCode);
        print(response.body);

        if (status) {
          var data = json.decode(response.body);
          print(response.body);
          print(data['access_token']);
          _save(data["access_token"]);
        } else {
          status = false;
        }
      });
    } catch (e) {
      print(e);
      status = false;
    }
  }

  Future<List> rigester(String username, String email, String password) async {
    String myUrl = "${Url.url}/api/auth/signup";
    try {
      await http.post(myUrl, body: {
        "password_confirmation": "$password",
        "password": "$password",
        "name": "$username",
        "email": "$email"
      }).then((response) {
        status = response.statusCode == HttpStatus.created;

        if (status) {
          var data = json.decode(response.body);
          print(response.body);
          return data;
        } else {
          status = false;
        }
      });
    } catch (e) {
      print(e);
      status = false;
    }
  }
}