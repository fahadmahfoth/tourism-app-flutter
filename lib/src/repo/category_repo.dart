import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:tourism/src/utls/url.dart';

class CategoryRepo {
  Future categorylist({userid, jobid}) async {
    try {
      final response = await http
          .get("${Url.url}/api/categoreis", headers: {});

      if (response.statusCode == HttpStatus.ok) {
        var result = jsonDecode(response.body);

        return result['data'];
      }
    } catch (e) {
      print("Error Whene Get Data ");
    }
  }
}
