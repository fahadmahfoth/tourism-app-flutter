import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SuggRepo {
  bool add_suggition;

  var status;

  Future<List> addSugg(String fullname, String email, String message) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print(value);
    String myUrl = "http://192.168.0.107:8000/api/suggests";
    try {
      await http.post(myUrl, headers: {
        // 'Content-Type': 'application/json',
        // 'Accept': 'application/json',
        'Authorization': 'Bearer $value',
      }, body: {
        "name": "$fullname",
        "email": "$email",
        "message": "$message",
      }).then((response) {
        print(response.body);
        status = response.statusCode == HttpStatus.ok;

        var data = json.decode(response.body);
        print(data.toString());
        return data;
      });
    } catch (e) {
      // print(e);
      status = false;
    }
  }
}
