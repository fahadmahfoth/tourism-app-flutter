import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class CategoryRepo {
  Future categorylist({userid, jobid}) async {
    try {
      final response = await http
          .get("http://192.168.0.107:8000/api/categoreis", headers: {});

      if (response.statusCode == HttpStatus.ok) {
        var result = jsonDecode(response.body);

        return result['data'];
      }
    } catch (e) {
      print("Error Whene Get Data ");
    }
  }
}
