import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/src/utls/url.dart';

class UserRepo {
  Future user() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print(value);
    try {
      final response = await http.get("${Url.url}/api/user", headers: {
        'Authorization': 'Bearer $value',
      });

      if (response.statusCode == HttpStatus.ok) {
        var result = jsonDecode(response.body);
        print(result);
        return result;
      }
    } catch (e) {
      print("Error Whene Get Data ");
    }
  }
}
