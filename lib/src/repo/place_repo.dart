import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:tourism/src/utls/url.dart';

class PlaceRepo {
  Future placeslist({userid, jobid}) async {
    try {
      final response =
          await http.get("${Url.url}/api/places", headers: {});

      if (response.statusCode == HttpStatus.ok) {
        var result = jsonDecode(response.body);
        // print(result);
        return result['data'];
      }
    } catch (e) {
      print("Error Whene Get Data ");
    }
  }
}
