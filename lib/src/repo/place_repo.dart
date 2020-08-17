import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class PlaceRepo {
  Future placeslist({userid, jobid}) async {
    try {
      final response =
          await http.get("http://192.168.0.107:8000/api/places", headers: {});

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
